# Score Data's R SDK

This Software Development Kit (SDK) is in R. The main purpose is to extract data from Score Data's data platform. It works thorugh REST APIs for models and algorithms. It was developed by Datata during the Spring of 2016.

## Usage

**Note**: documentation in a work in progress (refer to the code for details).

Users should only use directly the functions provided in the `user_functions.R` file. This are:

1. `API_data()`
2. `build_parameters()`

If `API_data()` is called without parameters it displays information on the available services and offers to use a wizard to create the necessary parameters (using `build_parameters()`) and execute them.

The `parameters` object is a list that contains:

- `service` (required)
- `target` (optional)
- `query` (optional)
- `id` (optional)
- `all` (optional)
- `show_graph` (optional)
- `upate` (optional)

Either `query` or `parameter` must be provided. If `show_graph` is provided, `update` is ignored. The `target` may be a model in a service or an exposed method.

### Examples

#### Get all the answers

```
> answers <- API_data()
...
Use wizard (y/n)? y
Service: questionnaires
Target (T) or Query (Q)? t
Target: answers
All (A) or ID (I)? a
...
>
```

Should give you a dataframe `answers` that contains all the answers in the platform. As of May 2016 it contains over 500,000 observations and takes around 3min to finish extracting the data from the platform.
