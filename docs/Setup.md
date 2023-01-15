# Project Setup

### Dependencies

* Install **Python** >= 3.9
* Install **Postgresql DB Engine**
* Install **python pip**
* Add Python, scripts to PATH
    * Windows
       ```
        {Python_dir}\Python39\Scripts\
        {Python_dir}\Python39\
       ```

    * Unix ( mac / linux )

        ```
        No need to add anything
        ```

* Project Python Venv
    * Windows
       ```
        not tested yet (you can skip this, or do it on your own)
       ```

    * Unix ( mac / linux )

        * create an empty directory (we'll call it db_home)

        ```
        mkdir db_home
        cd db_home
        mkdir db_venv
        python3 -m venv db_venv
        ```

* Clone the repository
    ```zsh
    git clone https://github.com/ibraheemalayan/COMP333-DB-Project.git .
    ```

* Install required modules
    ```zsh
    source db_venv/bin/activate
    pip3 install -r requirements/development_requirements.txt
    ```
    ```zsh
    cd src
    ```

* redirect domains to 127.0.0.1
    * Windows
        * open a powershell console as administrator and run:

            ```powershell
            Add-Content -Path 'C:\Windows\System32\drivers\etc\hosts' -Value '127.0.0.1     www.silal-payments.local'
            ```
        * clear dns cache
            ```powershell
            ipconfig /flushdns
            ```

    * Mac OS (unix)

        > Note: if lookups against hosts file are slow, [see this answer](https://superuser.com/questions/1596225/dns-resolution-delay-for-entries-in-etc-hosts#)

        * open a terminal run:

            ```zsh
            sudo zsh -c "echo -e '::1\twww.silal-payments.local' >> /etc/hosts"
            ```
        * clear dns cache
            ```zsh
            sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
            ```

    * Linux
        * open a terminal run:

            ```zsh
            sudo su
            echo -e '127.0.0.1\twww.silal-payments.local' >> /etc/hosts
            ```
        * no need to flush DNS

### IDE Extentions

> To enhance IDE performance, disable *all* extentions then enable only globally required extentions for VSCode ( CoPilot, Themes, Git ... ) and enable other extentions **for this workspace only**.

#### Required workspace extentions

* Python, find the [installation guide here](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
* flask-snippets, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=cstrap.flask-snippets)
* Pylance, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
* Python Indent, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)

#### Required global extentions

* Bash Debug, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=rogalmic.bash-debug)
* Bash Beautify, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=shakram02.bash-beautify)
* Commit Message Editor, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=adam-bender.commit-message-editor)
* Github Markdown Preivew, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=bierner.github-markdown-preview)
* GitHub Pull Requests and Issues, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)
* Gitmoji, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=seatonjiang.gitmoji-vscode)
* IntelliCode, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
* YAML, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
* Todo Tree, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
* Material Icon Theme, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
* Copilot, find the [plugin here](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)


# Collaboration Setup ( Pre Commit Hooks )
In order to collaborate to the remote repository you have to finish the following setup:

* enable format on save in VSCode
* install precommit https://pre-commit.com/#install
* run the following in the project root
    ```bash
    pre-commit install
    pre-commit install --hook-type commit-msg --hook-type pre-push
    ```
    > those commands will install the pre-commit hooks defined in the `.pre-commit-config.yaml` file for the local repo
