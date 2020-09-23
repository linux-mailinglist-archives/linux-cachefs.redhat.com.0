Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B619E275E43
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Sep 2020 19:07:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-E0b1GgnoPPWaexn1RjtpQA-1; Wed, 23 Sep 2020 13:07:51 -0400
X-MC-Unique: E0b1GgnoPPWaexn1RjtpQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21D72104D3E9;
	Wed, 23 Sep 2020 17:07:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 919907368F;
	Wed, 23 Sep 2020 17:07:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC6838C7AA;
	Wed, 23 Sep 2020 17:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NH7gA8009707 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 13:07:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31A5C49C35; Wed, 23 Sep 2020 17:07:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D4602B4D3A
	for <linux-cachefs@redhat.com>; Wed, 23 Sep 2020 17:07:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6BE101A56F
	for <linux-cachefs@redhat.com>; Wed, 23 Sep 2020 17:07:39 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-233-uMY-BHA5OXy5L8qa9H5_hQ-1;
	Wed, 23 Sep 2020 13:07:36 -0400
X-MC-Unique: uMY-BHA5OXy5L8qa9H5_hQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 109FAC56; Wed, 23 Sep 2020 13:07:35 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 109FAC56
Date: Wed, 23 Sep 2020 13:07:35 -0400
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20200923170735.GC4691@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<ecd78fe32a1d5a3c6cf3c5a77b1841293b3f5cb1.camel@hammerspace.com>
	<20200923124038.GA4691@fieldses.org>
	<a47553497db7c9ae9f68cbe703a12a4e4051aef2.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <a47553497db7c9ae9f68cbe703a12a4e4051aef2.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 23, 2020 at 01:09:01PM +0000, Trond Myklebust wrote:
> On Wed, 2020-09-23 at 08:40 -0400, J. Bruce Fields wrote:
> > On Tue, Sep 22, 2020 at 01:52:25PM +0000, Trond Myklebust wrote:
> > > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > > > Hi, 
> > > > 
> > > > I just thought I'd flesh out the other two issues I have found
> > > > with
> > > > re-exporting that are ultimately responsible for the biggest
> > > > performance bottlenecks. And both of them revolve around the
> > > > caching
> > > > of metadata file lookups in the NFS client.
> > > > 
> > > > Especially for the case where we are re-exporting a server many
> > > > milliseconds away (i.e. on-premise -> cloud), we want to be able
> > > > to
> > > > control how much the client caches metadata and file data so that
> > > > it's many LAN clients all benefit from the re-export server only
> > > > having to do the WAN lookups once (within a specified coherency
> > > > time).
> > > > 
> > > > Keeping the file data in the vfs page cache or on disk using
> > > > fscache/cachefiles is fairly straightforward, but keeping the
> > > > metadata cached is particularly difficult. And without the cached
> > > > metadata we introduce long delays before we can serve the already
> > > > present and locally cached file data to many waiting clients.
> > > > 
> > > > ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com wrote:
> > > > > 2) If we cache metadata on the re-export server using
> > > > > actimeo=3600,nocto we can
> > > > > cut the network packets back to the origin server to zero for
> > > > > repeated lookups.
> > > > > However, if a client of the re-export server walks paths and
> > > > > memory
> > > > > maps those
> > > > > files (i.e. loading an application), the re-export server
> > > > > starts
> > > > > issuing
> > > > > unexpected calls back to the origin server again,
> > > > > ignoring/invalidating the
> > > > > re-export server's NFS client cache. We worked around this this
> > > > > by
> > > > > patching an
> > > > > inode/iversion validity check in inode.c so that the NFS client
> > > > > cache on the
> > > > > re-export server is used. I'm not sure about the correctness of
> > > > > this patch but
> > > > > it works for our corner case.
> > > > 
> > > > If we use actimeo=3600,nocto (say) to mount a remote software
> > > > volume
> > > > on the re-export server, we can successfully cache the loading of
> > > > applications and walking of paths directly on the re-export
> > > > server
> > > > such that after a couple of runs, there are practically zero
> > > > packets
> > > > back to the originating NFS server (great!). But, if we then do
> > > > the
> > > > same thing on a client which is mounting that re-export server,
> > > > the
> > > > re-export server now starts issuing lots of calls back to the
> > > > originating server and invalidating it's client cache (bad!).
> > > > 
> > > > I'm not exactly sure why, but the iversion of the inode gets
> > > > changed
> > > > locally (due to atime modification?) most likely via invocation
> > > > of
> > > > method inode_inc_iversion_raw. Each time it gets incremented the
> > > > following call to validate attributes detects changes causing it
> > > > to
> > > > be reloaded from the originating server.
> > > > 
> > > > This patch helps to avoid this when applied to the re-export
> > > > server
> > > > but there may be other places where this happens too. I accept
> > > > that
> > > > this patch is probably not the right/general way to do this, but
> > > > it
> > > > helps to highlight the issue when re-exporting and it works well
> > > > for
> > > > our use case:
> > > > 
> > > > --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> > > > 00:23:03.000000000 +0000
> > > > +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> > > > @@ -1869,7 +1869,7 @@
> > > >  
> > > >         /* More cache consistency checks */
> > > >         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> > > > -               if (!inode_eq_iversion_raw(inode, fattr-
> > > > > change_attr)) {
> > > > +               if (inode_peek_iversion_raw(inode) < fattr-
> > > > > change_attr) {
> > > >                         /* Could it be a race with writeback? */
> > > >                         if (!(have_writers || have_delegation)) {
> > > >                                 invalid |= NFS_INO_INVALID_DATA
> > > 
> > > There is nothing in the base NFSv4, and NFSv4.1 specs that allow
> > > you to
> > > make assumptions about how the change attribute behaves over time.
> > > 
> > > The only safe way to do something like the above is if the server
> > > supports NFSv4.2 and also advertises support for the
> > > 'change_attr_type'
> > > attribute. In that case, you can check at mount time for whether or
> > > not
> > > the change attribute on this filesystem is one of the monotonic
> > > types
> > > which would allow the above optimisation.
> > 
> > Looking at https://tools.ietf.org/html/rfc7862#section-12.2.3 .... I
> > think that would be anything but NFS4_CHANGE_TYPE_IS_UNDEFINED ?
> > 
> > The Linux server's ctime is monotonic and will advertise that with
> > change_attr_type since 4.19.
> > 
> > So I think it would be easy to patch the client to check
> > change_attr_type and set an NFS_CAP_MONOTONIC_CHANGE flag in
> > server->caps, the hard part would be figuring out which optimisations
> > are OK.
> > 
> 
> The ctime is *not* monotonic. It can regress under server reboots and
> it can regress if someone deliberately changes the time.

So, anything other than IS_UNDEFINED or IS_TIME_METADATA?

Though the linux server is susceptible to some of that even when it
returns MONTONIC_INCR.  If the admin replaces the filesystem by an older
snapshot, there's not much we can do.  I'm not sure what degree of
gaurantee we need.

--b.

> We have code
> that tries to handle all these issues (see fattr->gencount and nfsi-
> >attr_gencount) because we've hit those issues before...


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

