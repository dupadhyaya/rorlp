# Time Series CLustering 
#https://petolau.github.io/TSrepr-clustering-time-series-representations/

library(TSrepr)
library(ggplot2)
library(data.table)
library(cluster)
library(clusterCrit)

data('elec_load')
dim(elec_load)
names(elec_load)
head(elec_load)

data_seasprof <- repr_matrix(elec_load, func = repr_seas_profile, args = list(freq = 48, func = mean), normalise = TRUE, func_norm = norm_z)
dim(data_seasprof)

clusterings <- lapply(c(2:7), function(x)
  pam(data_seasprof, x))

DB_values <- sapply(seq_along(clusterings), function(x) 
  intCriteria(data_seasprof, as.integer(clusterings[[x]]$clustering), c("Davies_Bouldin")))


ggplot(data.table(Clusters = 2:7, DBindex = unlist(DB_values)),
       aes(Clusters, DBindex)) +  geom_line(size = 1) +
  geom_point(size = 3) +  theme_bw()


# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(clusterings[[6]]$clustering),
                                        data_seasprof)))
data_plot[, Time := rep(1:ncol(data_seasprof), each = nrow(data_seasprof))]
data_plot[, ID := rep(1:nrow(data_seasprof), ncol(data_seasprof))]

# prepare medoids
centers <- data.table(melt(clusterings[[6]]$medoids))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value),
            color = "firebrick1", alpha = 0.80, size = 1.2) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()

data_gam <- repr_matrix(elec_load, func = repr_gam, args = list(freq = c(48, 48*7)),
                        normalise = TRUE, func_norm = norm_z)
dim(data_gam)


clusterings <- lapply(c(2:7), function(x)
  pam(data_gam, x))

DB_values <- sapply(seq_along(clusterings), function(x) 
  intCriteria(data_gam, as.integer(clusterings[[x]]$clustering),
              c("Davies_Bouldin")))
Let’s plot results of internal evaluation.

ggplot(data.table(Clusters = 2:7, DBindex = unlist(DB_values)),
       aes(Clusters, DBindex)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  theme_bw()

# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(clusterings[[6]]$clustering),
                                        data_gam)))
data_plot[, Time := rep(1:ncol(data_gam), each = nrow(data_gam))]
data_plot[, ID := rep(1:nrow(data_gam), ncol(data_gam))]

# prepare medoids
centers <- data.table(melt(clusterings[[6]]$medoids))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value),
            color = "firebrick1", alpha = 0.80, size = 1.2) +
  geom_vline(xintercept = 46, color = "dodgerblue2",
             size = 1.4, linetype = 5, alpha = 0.8) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()


data_dft <- repr_matrix(elec_load, func = repr_dft, args = list(coef = 48),
                        normalise = TRUE, func_norm = norm_z)
dim(data_dft)
## [1] 50 48
clusterings <- lapply(c(2:7), function(x)
  pam(data_dft, x))

DB_values <- sapply(seq_along(clusterings), function(x) 
  intCriteria(data_dft, as.integer(clusterings[[x]]$clustering),
              c("Davies_Bouldin")))


ggplot(data.table(Clusters = 2:7, DBindex = unlist(DB_values)),
       aes(Clusters, DBindex)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  theme_bw()


# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(clusterings[[3]]$clustering),
                                        data_dft)))
data_plot[, Time := rep(1:ncol(data_dft), each = nrow(data_dft))]
data_plot[, ID := rep(1:nrow(data_dft), ncol(data_dft))]

# prepare medoids
centers <- data.table(melt(clusterings[[3]]$medoids))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value),
            color = "firebrick1", alpha = 0.80, size = 1.2) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()


data_feaclip <- repr_matrix(elec_load, func = repr_feaclip,
                            windowing = TRUE, win_size = 48)

dim(data_feaclip)
## [1]  50 112
clusterings <- lapply(c(2:7), function(x)
  pam(data_feaclip, x))

DB_values <- sapply(seq_along(clusterings), function(x) 
  intCriteria(data_feaclip, as.integer(clusterings[[x]]$clustering),
              c("Davies_Bouldin")))
Let’s plot results of internal evaluation.

ggplot(data.table(Clusters = 2:7, DBindex = unlist(DB_values)),
       aes(Clusters, DBindex)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  theme_bw()


# prepare data for plotting
data_plot <- data.table(melt(data.table(class = as.factor(clusterings[[2]]$clustering),
                                        data_feaclip)))
data_plot[, Time := rep(1:ncol(data_feaclip), each = nrow(data_feaclip))]
data_plot[, ID := rep(1:nrow(data_feaclip), ncol(data_feaclip))]

# prepare medoids
centers <- data.table(melt(clusterings[[2]]$medoids))
setnames(centers, c("Var1", "Var2"), c("class", "Time"))
centers[, ID := class]

# plot the results
ggplot(data_plot, aes(Time, value, group = ID)) +
  facet_wrap(~class, ncol = 2, scales = "free_y") +
  geom_line(color = "grey10", alpha = 0.65) +
  geom_line(data = centers, aes(Time, value),
            color = "firebrick1", alpha = 0.80, size = 1.2) +
  labs(x = "Time", y = "Load (normalised)") +
  theme_bw()