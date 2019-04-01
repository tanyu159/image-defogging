function varargout = selectFile(varargin)
% SELECTFILE MATLAB code for selectFile.fig
%      SELECTFILE, by itself, creates a new SELECTFILE or raises the existing
%      singleton*.
%
%      H = SELECTFILE returns the handle to a new SELECTFILE or the handle to
%      the existing singleton*.
%
%      SELECTFILE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECTFILE.M with the given input arguments.
%
%      SELECTFILE('Property','Value',...) creates a new SELECTFILE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before selectFile_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to selectFile_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help selectFile

% Last Modified by GUIDE v2.5 07-Mar-2019 09:47:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selectFile_OpeningFcn, ...
                   'gui_OutputFcn',  @selectFile_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before selectFile is made visible.
function selectFile_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to selectFile (see VARARGIN)

% Choose default command line output for selectFile
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes selectFile wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = selectFile_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.选择文件按钮
function pushbutton1_Callback(hObject, eventdata, handles)
  axes(handles.axes5);%绑定控制的是那个axes
 [filename,pathname]=uigetfile({'*.jpg';'*.png'},'选择测试图片文件');
picturepath=[pathname,filename];
before=imread(picturepath);
imshow(before);  
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton4_Callback(hObject, eventdata, handles)
p=getimage(handles.axes5);%获取到axes5上显示的图片
J=darktest(p);%进行暗通道先验
axes(handles.axes6);%绑定结果输出在axes6
imshow(J);

%进行RETINEX去雾
k=Retinex(p);
axes(handles.axes7);%绑定结果输出在axes7
imshow(k);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
