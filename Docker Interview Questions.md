RUN VS CMD

| Feature            | `RUN`                                                                   | `CMD`                                                                      |
| ------------------ | ----------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| **Execution Time** | Build-time (when you run `docker build`)                                | Run-time (when you run `docker run`)                                       |
| **Result**         | Creates a new layer in the image                                        | Defines the default starting process for a container                       |
| **Overriding**     | Cannot be overridden at runtime; its effects are permanent in the image | Easily overridden by adding a command after the image name in `docker run` |
| **Frequency**      | Can use multiple times to build up layers                               | Only the last `CMD` in the Dockerfile is used                              |
