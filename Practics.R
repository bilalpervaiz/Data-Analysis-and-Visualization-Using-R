hello <- function() {
  print("Hello, world!")
}

# Simple vector

nums <- c(1, 2, 3, 4, 5)
print(nums)

# Mean and sum
mean(nums)
sum(nums)
#Loop
for (n in nums){
  print(paste("Number is",n))
}


# Conditional
for (n in nums) {
  if (n %% 2 == 0) {
    print(paste(n, "is even"))
  } else {
    print(paste(n, "is odd"))
  }
}

# Dataframes

df <- data.frame(
  Name = c("A", "B", "C"),
  Value = c(10, 20, 30)
)

df2 <- data.frame(
  x=c(1,3,4),
  y=c(4,5,6)
)

# View data
print(df)
summary(df)

df[df$Value > 15, ]

# Add new column
df$Squared <- df$Value^2
print(df)

df$percent <- df$Squared * 100
print(df)

write.csv(df, "output.csv", row.names = FALSE)


data <- read.csv("output.csv")
head(data)        # First 6 rows
summary(data)



library(sf)

# Read shapefile
shp <- st_read("hotosm_pse_health_facilities_polygons_shp.shp")
print(shp)
# Plot all features
ggplot() +
  geom_sf(data = shp, fill = "lightblue", color = "black") +
  labs(title = "Health Facilities Map")


# Plot shapefile
#plot(shp)

# Filter by attribute
names(shp)
unique(shp$healthcare)        # See all unique values in that column

subset_shp <- shp[shp$healthcare == "hospital", ]
#plot(subset_shp)
# Filter and plot only hospitals

ggplot() +
  geom_sf(data = subset_shp, fill = "red", color = "black") +
  labs(title = "Hospitals")





library(terra)

# Read raster
r <- rast("Patch 8.tif")
print(r)
plot(r)

# Basic stats
minmax(r)
mean(values(r), na.rm = TRUE)



library(ggplot2)

# Example data
df3 <- data.frame(
  x = rnorm(50),
  y = rnorm(50)
)

# Scatter plot
ggplot(df3, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Scatter Plot", x = "X-axis", y = "Y-axis")


# Line plot

df4 <- data.frame(
  year = 2000:2010,
  value = c(3, 4, 6, 8, 7, 9, 12, 15, 14, 18, 20)
)

ggplot(df4, aes(x = year, y = value)) +
  geom_line(color = "red", size = 1.2) +
  geom_point(size = 3) +
  labs(title = "Yearly Values")


# Bar chart
df5 <- data.frame(
  category = c("A", "B", "C"),
  count = c(10, 23, 15)
)

ggplot(df5, aes(x = category, y = count, fill = category)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Plot Example")

#Boxplot

df6 <- data.frame(
  group = rep(c("A", "B"), each = 10),
  value = c(rnorm(10, mean = 5), rnorm(10, mean = 7))
)

ggplot(df6, aes(x = group, y = value, fill = group)) +
  geom_boxplot() +
  labs(title = "Boxplot Example")



average <- function(a, b) {
  a + b / 2
}

print(average(2, 1))
