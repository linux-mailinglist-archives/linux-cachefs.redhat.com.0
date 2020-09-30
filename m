Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 29C3627F2A6
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Sep 2020 21:35:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-zr_5HHRmPlSM_4vekqpvlg-1; Wed, 30 Sep 2020 15:35:48 -0400
X-MC-Unique: zr_5HHRmPlSM_4vekqpvlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E24B8030B4;
	Wed, 30 Sep 2020 19:35:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31DE45576C;
	Wed, 30 Sep 2020 19:35:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB8A9183D021;
	Wed, 30 Sep 2020 19:35:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UJZb3s032222 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 15:35:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C624C2017E8F; Wed, 30 Sep 2020 19:35:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C038A2026F94
	for <linux-cachefs@redhat.com>; Wed, 30 Sep 2020 19:35:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89977858295
	for <linux-cachefs@redhat.com>; Wed, 30 Sep 2020 19:35:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-358-Nr4T7tt_PtmyyHHg7tUhEw-1;
	Wed, 30 Sep 2020 15:35:32 -0400
X-MC-Unique: Nr4T7tt_PtmyyHHg7tUhEw-1
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 610D120709;
	Wed, 30 Sep 2020 19:30:23 +0000 (UTC)
Message-ID: <97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Daire Byrne <daire@dneg.com>, linux-nfs <linux-nfs@vger.kernel.org>
Date: Wed, 30 Sep 2020 15:30:22 -0400
In-Reply-To: <1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs <linux-cachefs@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> Hi, 
> 
> I just thought I'd flesh out the other two issues I have found with re-exporting that are ultimately responsible for the biggest performance bottlenecks. And both of them revolve around the caching of metadata file lookups in the NFS client.
> 
> Especially for the case where we are re-exporting a server many milliseconds away (i.e. on-premise -> cloud), we want to be able to control how much the client caches metadata and file data so that it's many LAN clients all benefit from the re-export server only having to do the WAN lookups once (within a specified coherency time).
> 
> Keeping the file data in the vfs page cache or on disk using fscache/cachefiles is fairly straightforward, but keeping the metadata cached is particularly difficult. And without the cached metadata we introduce long delays before we can serve the already present and locally cached file data to many waiting clients.
> 
> ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com wrote:
> > 2) If we cache metadata on the re-export server using actimeo=3600,nocto we can
> > cut the network packets back to the origin server to zero for repeated lookups.
> > However, if a client of the re-export server walks paths and memory maps those
> > files (i.e. loading an application), the re-export server starts issuing
> > unexpected calls back to the origin server again, ignoring/invalidating the
> > re-export server's NFS client cache. We worked around this this by patching an
> > inode/iversion validity check in inode.c so that the NFS client cache on the
> > re-export server is used. I'm not sure about the correctness of this patch but
> > it works for our corner case.
> 
> If we use actimeo=3600,nocto (say) to mount a remote software volume on the re-export server, we can successfully cache the loading of applications and walking of paths directly on the re-export server such that after a couple of runs, there are practically zero packets back to the originating NFS server (great!). But, if we then do the same thing on a client which is mounting that re-export server, the re-export server now starts issuing lots of calls back to the originating server and invalidating it's client cache (bad!).
> 
> I'm not exactly sure why, but the iversion of the inode gets changed locally (due to atime modification?) most likely via invocation of method inode_inc_iversion_raw. Each time it gets incremented the following call to validate attributes detects changes causing it to be reloaded from the originating server.
> 

I'd expect the change attribute to track what's in actual inode on the
"home" server. The NFS client is supposed to (mostly) keep the raw
change attribute in its i_version field.

The only place we call inode_inc_iversion_raw is in
nfs_inode_add_request, which I don't think you'd be hitting unless you
were writing to the file while holding a write delegation.

What sort of server is hosting the actual data in your setup?


> This patch helps to avoid this when applied to the re-export server but there may be other places where this happens too. I accept that this patch is probably not the right/general way to do this, but it helps to highlight the issue when re-exporting and it works well for our use case:
> 
> --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27 00:23:03.000000000 +0000
> +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> @@ -1869,7 +1869,7 @@
>  
>         /* More cache consistency checks */
>         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> -               if (!inode_eq_iversion_raw(inode, fattr->change_attr)) {
> +               if (inode_peek_iversion_raw(inode) < fattr->change_attr) {
>                         /* Could it be a race with writeback? */
>                         if (!(have_writers || have_delegation)) {
>                                 invalid |= NFS_INO_INVALID_DATA
> 
> With this patch, the re-export server's NFS client attribute cache is maintained and used by all the clients that then mount it. When many hundreds of clients are all doing similar things at the same time, the re-export server's NFS client cache is invaluable in accelerating the lookups (getattrs).
> 
> Perhaps a more correct approach would be to detect when it is knfsd that is accessing the client mount and change the cache consistency checks accordingly? 

Yeah, I don't think you can do this for the reasons Trond outlined.
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

