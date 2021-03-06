function [] = bfgui_options(hf,evnt) %#ok
% The basic layout of this GUI was made with the help of guidegetter,
% available on the File Exchange at Mathworks.com


gd=guidata(hf);

hf2 = figure('units','normalized',...
    'position',[ 0.2526    0.2407    0.2401    0.3843],...
    'menubar','none','name','bfgui_options',...
    'numbertitle','off','color',[0.941 0.941 0.941]);


uicontrol(hf2,'style','text',...
    'units','normalized',...
    'position',[0.108 0.8461 0.339 0.0836],...
    'string','Colormap',...
    'backgroundcolor',[0.941 0.941 0.941]);
gd2.pop= uicontrol(hf2,'style','popupmenu',...
    'units','normalized',...
    'position',[0.447 0.879 0.453 0.0657],...
    'string',{'Jet';'GMT_Ocean';'GMT_haxby';...
    'GMT_globe';'GMT_gray';'GMT_drywet';...
    'GMT_relief_oceanonly';'GMT_relief';...
    'GMT_no_green';'physiographic';'vegetation';...
    'hillshade only'},...
    'value',gd.cval,...
    'backgroundcolor',[1 1 1],...
    'callback',@opt_cmap);


gd2.cmap_invert= uicontrol(hf2,'style','Checkbox',...
    'units','normalized',...
    'position',[0.447 0.779 0.453 0.0657],...
    'string','Invert Colormap',...
    'value',gd.invertcmap,...
    'backgroundcolor',[1 1 1]);

uicontrol(hf2,'style','text',...
    'units','normalized',...
    'position',[0.108 0.675 0.339 0.0836],...
    'string','Color Limits',...
    'backgroundcolor',[0.941 0.941 0.941]);
gd2.editlow = uicontrol(hf2,'style','edit',...
    'units','normalized',...
    'position',[0.447 0.685 0.198 0.0746],...
    'string',sprintf('%0.1f',gd.clims(1)),...
    'backgroundcolor',[1 1 1]);
gd2.edithigh = uicontrol(hf2,'style','edit',...
    'units','normalized',...
    'position',[0.703 0.685 0.195 0.0746],...
    'string',sprintf('%0.1f',gd.clims(2)),...
    'backgroundcolor',[1 1 1]);




gd2.applyhs=uicontrol(hf2,'style','Checkbox',...
    'units','normalized',...
    'position',[0.447 0.5750 0.453 0.0657],...
    'string','Hillshade Effect',...
    'value',gd.hseffect,...
    'backgroundcolor',[1 1 1],...
    'callback',@opt_applyhs);


uicontrol(hf2,'style','text',...
    'units','normalized',...
    'position',[0.108 0.463 0.339 0.0836],...
    'string','Azimuth',...
    'backgroundcolor',[0.941 0.941 0.941]);
gd2.azi = uicontrol(hf2,'style','edit',...
    'units','normalized',...
    'position',[0.447 0.472 0.453 0.0746],...
    'string',sprintf('%0.1f',gd.azimuth),...
    'backgroundcolor',[1 1 1]);

uicontrol(hf2,'style','text',...
    'units','normalized',...
    'position',[0.108 0.313 0.339 0.0836],...
    'string','Altitude',...
    'backgroundcolor',[0.941 0.941 0.941]);
gd2.alt = uicontrol(hf2,'style','edit',...
    'units','normalized',...
    'position',[0.447 0.322 0.453 0.0746],...
    'string',sprintf('%0.1f',gd.altitude),...
    'backgroundcolor',[1 1 1]);

uicontrol(hf2,'style','text',...
    'units','normalized',...
    'position',[0.108 0.164 0.339 0.0836],...
    'string','Z Factor',...
    'backgroundcolor',[0.941 0.941 0.941]);
gd2.zfac = uicontrol(hf2,'style',....
    'edit','units',...
    'normalized','position',....
    [0.447 0.173 0.453 0.0746],...
    'backgroundcolor',[1 1 1],...
    'string',sprintf('%0.1f',gd.zfactor));


gd2.apply = uicontrol(hf2,'style','pushbutton',...
    'units','normalized',...
    'position',[0.245 0.0119 0.303 0.0866],...
    'string','pushbutton1',...
    'backgroundcolor',[0.941 0.941 0.941],...
    'string','Apply',...
    'callback',@local_apply);

gd2.ok = uicontrol(hf2,'style','pushbutton',...
    'units','normalized',...
    'position',[0.645 0.0119 0.303 0.0866],...
    'string','pushbutton1',...
    'backgroundcolor',[0.941 0.941 0.941],...
    'string','OK',...
    'callback',@local_close);


val=get(gd2.pop,'value');
if val==12
    set(gd2.applyhs,'value',1)
    set(gd2.azi,'enable','on')
    set(gd2.zfac,'enable','on')
    set(gd2.alt,'enable','on')
    set(gd2.cmap_invert,'enable','off')
    set(gd2.editlow,'enable','off')
    set(gd2.edithigh,'enable','off')
end

if gd.hseffect==0
    set(gd2.azi,'enable','off')
    set(gd2.zfac,'enable','off')
    set(gd2.alt,'enable','off')
end


gd2.hf=hf;
guidata(hf2,gd2)

uiwait
local_apply(hf2)



% gd=guidata(hf);
% set(gd.ph,'xdata',gd.xs./1000,...
%     'ydata',gd.ys./1000,...
%     'zdata',zeros(size(gd.zs)),...
%     'cdata',gd.hs);
% set(gd.ax1,'xlim',gd.xlims./1000,'ylim',gd.ylims./1000,...
%     'clim',gd.clims);
% 
% set(gd.zoom,'backgroundcolor',[0.9255    0.9137    0.8471]);
% 
% set(gd.str,'string',['Displaying ',gd.filename, '  Resolution = ',...
%     sprintf('%0.0f m',gd.res)],...
%     'foregroundcolor','k')
% colormap(gd.cmap);


% guidata(hf,gd);
close(hf2)
clear gd2




