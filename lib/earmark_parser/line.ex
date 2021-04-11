defmodule EarmarkParser.Line do

  @moduledoc false

  defmodule Blank  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, content: "", inside_code: false)
  end
  defmodule Ruler  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, type: "- or * or _", inside_code: false)
  end

  defmodule Heading  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, level: 1, content: "inline text", inside_code: false)
  end

  defmodule BlockQuote  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, content: "text", inside_code: false)
  end

  defmodule Indent  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, level: 0, content: "text", inside_code: false)
  end

  defmodule Fence  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, delimiter: "~ or `", language: nil, inside_code: false)
  end

  defmodule Html  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, tag: "", inside_code: false)
  end

  defmodule HtmlComment  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, complete: true, inside_code: false)
  end


  defmodule IdDef  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, id: nil, url: nil, title: nil, inside_code: false)
  end

  defmodule FnDef  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, id: nil, content: "text", inside_code: false)
  end

  defmodule ListItem do
    @moduledoc false
    defstruct(
      lnb: 0,
      type: :ul,
      line: "",
      indent: -1,
      bullet: "* or -",
      content: "text",
      initial_indent: 0,
      inside_code: false,
      list_indent: 0
    )
  end

  defmodule SetextUnderlineHeading  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, level: 1, inside_code: false)
  end

  defmodule TableLine  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, content: "", columns: 0, inside_code: false, is_header: false, needs_header: false)
  end

  defmodule Ial  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, attrs: "", inside_code: false, verbatim: "")
  end
  defmodule Text  do
    @moduledoc false
    defstruct(lnb: 0, line: "", indent: -1, content: "", inside_code: false)
  end


  @type t ::
          %Blank{}
          | %Ruler{}
          | %Heading{}
          | %BlockQuote{}
          | %Indent{}
          | %Fence{}
          | %Html{}
          | %HtmlComment{}
          | %IdDef{}
          | %FnDef{}
          | %ListItem{}
          | %SetextUnderlineHeading{}
          | %TableLine{}
          | %Ial{}
          | %Text{}

  @type ts :: list(t)
end

# SPDX-License-Identifier: Apache-2.0
