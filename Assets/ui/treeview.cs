using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using Unity.VisualScripting.FullSerializer;
using System.Linq;
using System;
using Mono.Cecil.Cil;

public class PlatformNavigatorTree : MonoBehaviour
{

    [SerializeField]
    // protected VisualTreeAsset uxml;

    private TreeView treeView;

    void Clicked()
    {
        Debug.Log("Clicked!!");
    }

    protected class DataClass
    {
        public string category_name;

        public DataClass(string i)
        {
            category_name = i;
        }
    }

    void CreateGUI()
    {
        var uiDocument = GetComponent<UIDocument>();
        Debug.Log(uiDocument);
        treeView = uiDocument.rootVisualElement.Q<TreeView>(); // as TreeView;

        Debug.Log("Here!");

        string[] categories = { "1 Kahkovka Dam Destruction", "2 Flood & Reservoir", "3 Marine Environment" };
        // string[][] children = new string[4][];


        // for (int i = 0; i < categories.Length; i++)
        // {
        //     children[i] = { "4" };
        // }
        int index = 0;
        var list = new List<TreeViewItemData<DataClass>>();

        foreach (var category in categories)
        {
            // treeView.AddItem<Button>(new TreeViewItemData<string>(newButton));
            var newItem = new TreeViewItemData<DataClass>(++index, new DataClass(category));
            list.Add(newItem);
            // treeView.AddItem(newItem);
            // treeView.AddItem<string>(new TreeViewItemData<string>());
            // var newButton = new Button(Clicked);
            // newButton.text = category;
        }

        Debug.Log("now here!");

        treeView.SetRootItems(list);
        treeView.makeItem = () => new Label();
        treeView.bindItem = (VisualElement elem, int index) => (elem as Label).text = treeView.GetItemDataForIndex<DataClass>(index).category_name;

        treeView.Rebuild();

        // treeView.Add("");

    }


    void Start()
    {
        CreateGUI();
    }

    // [SerializeField]
    // protected VisualTreeAsset uxml;

    // [MenuItem("Planets/Standard Tree")]
    // static void Summon()
    // {
    //     GetWindow<PlatformNavigatorTree>("Standard Navigation Tree");
    // }

    // void CreateGUI()
    // {
    //     // uxml.CloneTree(rootVisualElement);
    //     // var treeView = rootVisualElement.Q<TreeView>();

    //     // // Call TreeView.SetRootItems() to populate the data in the tree.
    //     // treeView.SetRootItems(treeRoots);

    //     // // Set TreeView.makeItem to initialize each node in the tree.
    //     // treeView.makeItem = () => new Label();

    //     // // Set TreeView.bindItem to bind an initialized node to a data item.
    //     // treeView.bindItem = (VisualElement element, int index) =>
    //     //     (element as Label).text = treeView.GetItemDataForIndex<IPlanetOrGroup>(index).name;
    // }
}