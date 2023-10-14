import dash

# import dash_core_components as dcc
# import dash_html_components as html
from dash import html, dcc
from dash.dependencies import Input, Output
import dash_bootstrap_components as dbc


app = dash.Dash(__name__, external_stylesheets=[dbc.themes.SLATE])


app.layout = dbc.Container([

    dbc.Row([

        dbc.Col([

            html.Div([ 
                html.H1([ "Welcome to dash application"

                ])
            ])
        ])
    ])
])

if __name__ == "__main__":
    app.run_server(debug=True, host='0.0.0.0', port=int('8050'))
