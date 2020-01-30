function run_bridge_fem_extract()

close('all')
addpath('fem_mesh_utils')

% load
model = mphload('model_bridge/bridge.mph');

% data
data_edge = extract_3d(model, 'dset1', 'adj2', 'edge_3d');
data_surface = extract_3d(model, 'dset1', 'adj1', 'surface_3d');

% save
save('model_bridge/bridge.mat', 'data_edge', 'data_surface')

end

function data = extract_3d(model, dataset, sel, type)

% geom
expr = {'u', 'v', 'w', 'solid.disp'};
[data.geom, value] = extract_comsol(model, dataset, sel, type, expr);
data.disp_x = value{1};
data.disp_y = value{2};
data.disp_z = value{3};
data.disp = value{4};

end
