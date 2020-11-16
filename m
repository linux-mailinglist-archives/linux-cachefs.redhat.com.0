Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC272B48F9
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 16:19:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ohUdbB67NcGIuhobsGyeog-1; Mon, 16 Nov 2020 10:19:13 -0500
X-MC-Unique: ohUdbB67NcGIuhobsGyeog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0196B5F9C0;
	Mon, 16 Nov 2020 15:19:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B29515C5B7;
	Mon, 16 Nov 2020 15:19:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDC11183D020;
	Mon, 16 Nov 2020 15:19:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGFIvQx020533 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 10:18:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE650201EE2E; Mon, 16 Nov 2020 15:18:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8470205F3B0
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:18:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DF6790E42F
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:18:54 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-42-l8vYl4rAN8S7mN8YZNMMig-1;
	Mon, 16 Nov 2020 10:18:51 -0500
X-MC-Unique: l8vYl4rAN8S7mN8YZNMMig-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 0E2DA7EC; Mon, 16 Nov 2020 10:18:50 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 0E2DA7EC
Date: Mon, 16 Nov 2020 10:18:50 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201116151850.GD898@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<217712894.87456370.1605358643862.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <217712894.87456370.1605358643862.JavaMail.zimbra@dneg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>, jlayton@kernel.org,
	Trond Myklebust <trondmy@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff, does something like this look reasonable?

--b.

On Sat, Nov 14, 2020 at 12:57:24PM +0000, Daire Byrne wrote:
> ----- On 13 Nov, 2020, at 22:26, bfields bfields@fieldses.org wrote:
> > On Fri, Nov 13, 2020 at 09:50:50AM -0500, bfields wrote:
> >> Ah-hah!  So, it's inode_query_iversion() that's modifying a nfs inode's
> >> i_version.  That's a special thing that only nfsd would do.
> >> 
> >> I think that's totally fixable, we'll just have to think a little about
> >> how....
> > 
> > I wonder if something like this helps?--b.
> > 
> > commit 0add88a9ccc5
> > Author: J. Bruce Fields <bfields@redhat.com>
> > Date:   Fri Nov 13 17:03:04 2020 -0500
> > 
> >    nfs: don't mangle i_version on NFS
> >    
> >    The i_version on NFS has pretty much opaque to the client, so we don't
> >    want to give the low bit any special interpretation.
> >    
> >    Define a new FS_PRIVATE_I_VERSION flag for filesystems that manage the
> >    i_version on their own.
> >    
> >    Signed-off-by: J. Bruce Fields <bfields@redhat.com>
> > 
> > diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
> > index 29ec8b09a52d..9b8dd5b713a7 100644
> > --- a/fs/nfs/fs_context.c
> > +++ b/fs/nfs/fs_context.c
> > @@ -1488,7 +1488,8 @@ struct file_system_type nfs_fs_type = {
> > 	.init_fs_context	= nfs_init_fs_context,
> > 	.parameters		= nfs_fs_parameters,
> > 	.kill_sb		= nfs_kill_super,
> > -	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA,
> > +	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA|
> > +				  FS_PRIVATE_I_VERSION,
> > };
> > MODULE_ALIAS_FS("nfs");
> > EXPORT_SYMBOL_GPL(nfs_fs_type);
> > @@ -1500,7 +1501,8 @@ struct file_system_type nfs4_fs_type = {
> > 	.init_fs_context	= nfs_init_fs_context,
> > 	.parameters		= nfs_fs_parameters,
> > 	.kill_sb		= nfs_kill_super,
> > -	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA,
> > +	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA|
> > +				  FS_PRIVATE_I_VERSION,
> > };
> > MODULE_ALIAS_FS("nfs4");
> > MODULE_ALIAS("nfs4");
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index 21cc971fd960..c5bb4268228b 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -2217,6 +2217,7 @@ struct file_system_type {
> > #define FS_HAS_SUBTYPE		4
> > #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
> > #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
> > +#define FS_PRIVATE_I_VERSION	32	/* i_version managed by filesystem */
> > #define FS_THP_SUPPORT		8192	/* Remove once all fs converted */
> > #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename()
> > internally. */
> > 	int (*init_fs_context)(struct fs_context *);
> > diff --git a/include/linux/iversion.h b/include/linux/iversion.h
> > index 2917ef990d43..52c790a847de 100644
> > --- a/include/linux/iversion.h
> > +++ b/include/linux/iversion.h
> > @@ -307,6 +307,8 @@ inode_query_iversion(struct inode *inode)
> > 	u64 cur, old, new;
> > 
> > 	cur = inode_peek_iversion_raw(inode);
> > +	if (inode->i_sb->s_type->fs_flags & FS_PRIVATE_I_VERSION)
> > +		return cur;
> > 	for (;;) {
> > 		/* If flag is already set, then no need to swap */
> >  		if (cur & I_VERSION_QUERIED) {
> 
> Yes, I can confirm that this absolutely helps! I replaced our (brute force) iversion patch with this (much nicer) patch and we got the same improvement; nfsd and it's clients no longer cause the re-export server's client cache to constantly be re-validated. The re-export server can now serve the same results to many clients from cache. Thanks so much for spending the time to track this down. If merged, future (crazy) NFS re-exporters will benefit from the metadata performance improvement/acceleration!
> 
> Now if anyone has any ideas why all the read calls to the originating server are limited to a maximum of 128k (with rsize=1M) when coming via the re-export server's nfsd threads, I see that as the next biggest performance issue. Reading directly on the re-export server with a userspace process issues 1MB reads as expected. It doesn't happen for writes (wsize=1MB all the way through) but I'm not sure if that has more to do with async and write back caching helping to build up the size before commit?
> 
> I figure the other remaining items on my (wish) list are probably more in the "won't fix" or "can't fix" category (except maybe the NFSv4.0 input/output errors?).
> 
> Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

