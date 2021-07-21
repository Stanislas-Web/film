import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import 'movie_detail.dart';
import 'package:film/ui/widget/animation.dart';

class Film extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FilmState();
  }
}

class FilmState extends State<Film> {
  @override
  void initState() {
    super.initState();
    // blocMovie.fetchAllMovies();
  }

  @override
  void dispose() {
    // blocMovie.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left:10),
                  child: Center(child: Text('film ',style: TextStyle(
            color:Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),),),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right:10),
            child: Icon(Icons.search,color: Colors.grey,)
            )
        ],
      ),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DelayedAnimation(child: FlutterLogo(size: 200,),delay: 1500,),
            SizedBox(height:20),
            DelayedAnimation(child: Text('Bonjour',style: TextStyle(
              fontSize:50,
              fontWeight:FontWeight.bold,
            ),), delay:2500 )
          ],
        ),
      )
           
    );
  }

    Widget buildTv(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.results.length,
        scrollDirection: Axis.horizontal,
        // gridDelegate:
        // new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
              children:[
                Container(
                  margin: EdgeInsets.all(10),
                  width:180,
                  height: 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}'),
                      fit: BoxFit.cover,
                    )
                  ),

                ),
                Positioned(child:Container(
                  margin: EdgeInsets.all(10),
                  width:180,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  
                    borderRadius: BorderRadius.circular(20),
                  
                  ),

                ),
                ),
                //text 
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:20),
                          child: Text(snapshot.data.results[index].title,
                          overflow: TextOverflow.ellipsis,
                           style: TextStyle(
                            color:Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),

                          textAlign: TextAlign.center,),
                        )
                        
                      ]
                    ),

                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   child: Text(snapshot.data.results[index].overview)),

              ]
          );
          // return (
          //   child: InkResponse(
          //     enableFeedback: true,
          //     child: Image.network(
          //       'https://image.tmdb.org/t/p/w185${snapshot.data
          //           .results[index].poster_path}',
          //       fit: BoxFit.cover,
          //     ),
          //     onTap: () => openDetailPage(snapshot.data, index),
          //   ),
          // );
        });
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.results.length,
        scrollDirection: Axis.horizontal,
        // gridDelegate:
        // new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
              children:[
                Container(
                  margin: EdgeInsets.all(10),
                  width:200,
                  height: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}'),
                      fit: BoxFit.cover,
                    )
                  ),

                ),
                Positioned(child:    Container(
                  margin: EdgeInsets.all(10),
                  width:200,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  
                    borderRadius: BorderRadius.circular(20),
                  
                  ),

                ),
                ),
                //text 
                Positioned(
                  bottom: 70,
                  right: 0,
                  left: 0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:20),
                          child: Text(snapshot.data.results[index].title,
                          overflow: TextOverflow.ellipsis,
                           style: TextStyle(
                            color:Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),

                          textAlign: TextAlign.center,),
                        )
                        
                      ]
                    ),

                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   child: Text(snapshot.data.results[index].overview)),

              ]
          );
          // return (
          //   child: InkResponse(
          //     enableFeedback: true,
          //     child: Image.network(
          //       'https://image.tmdb.org/t/p/w185${snapshot.data
          //           .results[index].poster_path}',
          //       fit: BoxFit.cover,
          //     ),
          //     onTap: () => openDetailPage(snapshot.data, index),
          //   ),
          // );
        });
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdrop_path,
          description: data.results[index].overview,
          releaseDate: data.results[index].release_date,
          voteAverage: data.results[index].vote_average.toString(),
          movieId: data.results[index].id,
        );
      }),
    );
  }
}