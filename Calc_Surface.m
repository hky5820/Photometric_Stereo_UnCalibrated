function surface = Calc_Surface(normal_surface)

%% Get x & y component
x = normal_surface(:,:,1);
y = normal_surface(:,:,2);
c = 0; % integration constant
surface = zeros(size(x));

%% Calculate integration
%% Move x axis first
integral1 = cumsum(x(1,:)) + repmat(c, [1 size(x,2)]);
integral2 = cumsum(y,1) + repmat(integral1, [size(y,1) 1]);
surface1 = integral2;

%% Move y axis first
integral1 = cumsum(y(:,1)) + repmat(c, [size(y,1) 1]);
integral2 = cumsum(x,2) + repmat(integral1, [1 size(x,2)]);
surface2 = integral2;

%% Get average of each surface
surface = (surface1 + surface2) / 2;