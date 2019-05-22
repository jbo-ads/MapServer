<StyledLayerDescriptor version="1.1.0">
  <NamedLayer>
    <Name>lline</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <Rule>
          <LineSymbolizer>
            <Stroke>
              <SvgParameter name="stroke-width">5</SvgParameter>
              <SvgParameter name="stroke-opacity">0.5</SvgParameter>
              <SvgParameter name="stroke">#FFFF00</SvgParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
  <NamedLayer>
    <Name>lpolygon</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <Rule>
          <PolygonSymbolizer>
            <Stroke>
              <SvgParameter name="stroke-width">1</SvgParameter>
              <SvgParameter name="stroke-opacity">0.5</SvgParameter>
              <SvgParameter name="stroke">#FF00FF</SvgParameter>
            </Stroke>
            <Fill>
              <SvgParameter name="fill-opacity">0.5</SvgParameter>
              <SvgParameter name="fill">#00FFFF</SvgParameter>
            </Fill>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
  <NamedLayer>
    <Name>lpoint</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <Rule>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>star</WellKnownName>
                <Stroke>
                  <SvgParameter name="stroke">#FF0000</SvgParameter>
                  <SvgParameter name="stroke-opacity">1</SvgParameter>
                  <SvgParameter name="stroke-width">1</SvgParameter>
                </Stroke>
                <Fill>
                  <SvgParameter name="fill">#0000FF</SvgParameter>
                  <SvgParameter name="fill-opacity">0.1</SvgParameter>
                </Fill>
              </Mark>
              <Size>20</Size>
              <Rotation>180</Rotation>
              <Displacement>
                <DisplacementX>2</DisplacementX>
                <DisplacementY>2</DisplacementY>
              </Displacement>
              <Opacity>0.5</Opacity>
            </Graphic>
          </PointSymbolizer>
          <TextSymbolizer>
            <Label>
              <PropertyName>name</PropertyName>
            </Label>
            <Font>
              <SvgParameter name="font-family">vera</SvgParameter>
              <SvgParameter name="font-weight">bold</SvgParameter>
              <SvgParameter name="font-size">12</SvgParameter>
            </Font>
            <Fill>
              <SvgParameter name="fill">#FFFFFF</SvgParameter>
            </Fill>
            <LabelPlacement>
              <PointPlacement>
                <Displacement>
                  <DisplacementX>2</DisplacementX>
                  <DisplacementY>20</DisplacementY>
                </Displacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Rotation>15</Rotation>
              </PointPlacement>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill>
                <SvgParameter name="fill">#00FF00</SvgParameter>
              </Fill>
            </Halo>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
