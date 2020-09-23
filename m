Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CF99927581C
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Sep 2020 14:41:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-haf2FbY7NWyugMSAScKaZQ-1; Wed, 23 Sep 2020 08:40:58 -0400
X-MC-Unique: haf2FbY7NWyugMSAScKaZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9C18ECE58;
	Wed, 23 Sep 2020 12:40:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C9D73668;
	Wed, 23 Sep 2020 12:40:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B3DC8C7AD;
	Wed, 23 Sep 2020 12:40:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NCejOn003913 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 08:40:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A14DF496B; Wed, 23 Sep 2020 12:40:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94079F5594
	for <linux-cachefs@redhat.com>; Wed, 23 Sep 2020 12:40:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D938801779
	for <linux-cachefs@redhat.com>; Wed, 23 Sep 2020 12:40:43 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-565-jvEx_7FrPfuppBpwWMYFZA-1;
	Wed, 23 Sep 2020 08:40:40 -0400
X-MC-Unique: jvEx_7FrPfuppBpwWMYFZA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id C099D4F41; Wed, 23 Sep 2020 08:40:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org C099D4F41
Date: Wed, 23 Sep 2020 08:40:38 -0400
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20200923124038.GA4691@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<ecd78fe32a1d5a3c6cf3c5a77b1841293b3f5cb1.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <ecd78fe32a1d5a3c6cf3c5a77b1841293b3f5cb1.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
From: bfields@fieldses.org (J. Bruce Fields)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"daire@dneg.com" <daire@dneg.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 22, 2020 at 01:52:25PM +0000, Trond Myklebust wrote:
> On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > Hi, 
> > 
> > I just thought I'd flesh out the other two issues I have found with
> > re-exporting that are ultimately responsible for the biggest
> > performance bottlenecks. And both of them revolve around the caching
> > of metadata file lookups in the NFS client.
> > 
> > Especially for the case where we are re-exporting a server many
> > milliseconds away (i.e. on-premise -> cloud), we want to be able to
> > control how much the client caches metadata and file data so that
> > it's many LAN clients all benefit from the re-export server only
> > having to do the WAN lookups once (within a specified coherency
> > time).
> > 
> > Keeping the file data in the vfs page cache or on disk using
> > fscache/cachefiles is fairly straightforward, but keeping the
> > metadata cached is particularly difficult. And without the cached
> > metadata we introduce long delays before we can serve the already
> > present and locally cached file data to many waiting clients.
> > 
> > ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com wrote:
> > > 2) If we cache metadata on the re-export server using
> > > actimeo=3600,nocto we can
> > > cut the network packets back to the origin server to zero for
> > > repeated lookups.
> > > However, if a client of the re-export server walks paths and memory
> > > maps those
> > > files (i.e. loading an application), the re-export server starts
> > > issuing
> > > unexpected calls back to the origin server again,
> > > ignoring/invalidating the
> > > re-export server's NFS client cache. We worked around this this by
> > > patching an
> > > inode/iversion validity check in inode.c so that the NFS client
> > > cache on the
> > > re-export server is used. I'm not sure about the correctness of
> > > this patch but
> > > it works for our corner case.
> > 
> > If we use actimeo=3600,nocto (say) to mount a remote software volume
> > on the re-export server, we can successfully cache the loading of
> > applications and walking of paths directly on the re-export server
> > such that after a couple of runs, there are practically zero packets
> > back to the originating NFS server (great!). But, if we then do the
> > same thing on a client which is mounting that re-export server, the
> > re-export server now starts issuing lots of calls back to the
> > originating server and invalidating it's client cache (bad!).
> > 
> > I'm not exactly sure why, but the iversion of the inode gets changed
> > locally (due to atime modification?) most likely via invocation of
> > method inode_inc_iversion_raw. Each time it gets incremented the
> > following call to validate attributes detects changes causing it to
> > be reloaded from the originating server.
> > 
> > This patch helps to avoid this when applied to the re-export server
> > but there may be other places where this happens too. I accept that
> > this patch is probably not the right/general way to do this, but it
> > helps to highlight the issue when re-exporting and it works well for
> > our use case:
> > 
> > --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> > 00:23:03.000000000 +0000
> > +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> > @@ -1869,7 +1869,7 @@
> >  
> >         /* More cache consistency checks */
> >         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> > -               if (!inode_eq_iversion_raw(inode, fattr-
> > >change_attr)) {
> > +               if (inode_peek_iversion_raw(inode) < fattr-
> > >change_attr) {
> >                         /* Could it be a race with writeback? */
> >                         if (!(have_writers || have_delegation)) {
> >                                 invalid |= NFS_INO_INVALID_DATA
> 
> 
> There is nothing in the base NFSv4, and NFSv4.1 specs that allow you to
> make assumptions about how the change attribute behaves over time.
> 
> The only safe way to do something like the above is if the server
> supports NFSv4.2 and also advertises support for the 'change_attr_type'
> attribute. In that case, you can check at mount time for whether or not
> the change attribute on this filesystem is one of the monotonic types
> which would allow the above optimisation.

Looking at https://tools.ietf.org/html/rfc7862#section-12.2.3 .... I
think that would be anything but NFS4_CHANGE_TYPE_IS_UNDEFINED ?

The Linux server's ctime is monotonic and will advertise that with
change_attr_type since 4.19.

So I think it would be easy to patch the client to check
change_attr_type and set an NFS_CAP_MONOTONIC_CHANGE flag in
server->caps, the hard part would be figuring out which optimisations
are OK.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

