
########################################################
# Files

SET (wms_SRCS
  qgswms.cpp
  qgswmsutils.cpp
  qgsdxfwriter.cpp
  qgswmsdescribelayer.cpp
  qgswmsgetcapabilities.cpp
  qgswmsgetcontext.cpp
  qgswmsgetfeatureinfo.cpp
  qgswmsgetlegendgraphics.cpp
  qgswmsgetmap.cpp
  qgswmsgetprint.cpp
  qgswmsgetschemaextension.cpp
  qgswmsgetstyle.cpp
  qgswmsgetstyles.cpp
  qgsmaprendererjobproxy.cpp
  qgsmediancut.cpp
  qgswmsrenderer.cpp
)

########################################################
# Build

ADD_LIBRARY (wms MODULE ${wms_SRCS})


INCLUDE_DIRECTORIES(SYSTEM
  ${GDAL_INCLUDE_DIR}
  ${GEOS_INCLUDE_DIR}
  ${PROJ_INCLUDE_DIR}
  ${POSTGRES_INCLUDE_DIR}
)

INCLUDE_DIRECTORIES(
  ${CMAKE_SOURCE_DIR}/src/core
  ${CMAKE_SOURCE_DIR}/src/core/expression
  ${CMAKE_SOURCE_DIR}/src/core/dxf
  ${CMAKE_SOURCE_DIR}/src/core/expression
  ${CMAKE_SOURCE_DIR}/src/core/geometry
  ${CMAKE_SOURCE_DIR}/src/core/metadata
  ${CMAKE_SOURCE_DIR}/src/core/raster
  ${CMAKE_SOURCE_DIR}/src/core/symbology-ng
  ${CMAKE_SOURCE_DIR}/src/core/composer
  ${CMAKE_SOURCE_DIR}/src/core/layertree
  ${CMAKE_SOURCE_DIR}/src/gui
  ${CMAKE_SOURCE_DIR}/src/gui/editorwidgets
  ${CMAKE_SOURCE_DIR}/src/gui/editorwidgets/core
  ../..
  ..
  .

  ${CMAKE_BINARY_DIR}/src/core
  ${CMAKE_BINARY_DIR}/src/gui
  ${CMAKE_BINARY_DIR}/src/python
  ${CMAKE_BINARY_DIR}/src/analysis
  ${CMAKE_BINARY_DIR}/src/server
  ${CMAKE_CURRENT_BINARY_DIR}
)


#endif
TARGET_LINK_LIBRARIES(wms
  qgis_core
  qgis_server
)


########################################################
# Install

INSTALL(TARGETS wms
    RUNTIME DESTINATION ${QGIS_SERVER_MODULE_DIR}
    LIBRARY DESTINATION ${QGIS_SERVER_MODULE_DIR}
)

