Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF7E2B2D3B
	for <lists+linux-cachefs@lfdr.de>; Sat, 14 Nov 2020 13:57:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-ZhwUmNNzOtGvU8Rj602OWA-1; Sat, 14 Nov 2020 07:57:46 -0500
X-MC-Unique: ZhwUmNNzOtGvU8Rj602OWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D002C1006C82;
	Sat, 14 Nov 2020 12:57:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E1D5B4A6;
	Sat, 14 Nov 2020 12:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 302DB180B657;
	Sat, 14 Nov 2020 12:57:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AECvX2L021710 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 14 Nov 2020 07:57:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A4672166B44; Sat, 14 Nov 2020 12:57:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63E342166B28
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 12:57:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EA55811E78
	for <linux-cachefs@redhat.com>; Sat, 14 Nov 2020 12:57:30 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-237-N0iZeDp9PZe15rPfMhllBg-1;
	Sat, 14 Nov 2020 07:57:27 -0500
X-MC-Unique: N0iZeDp9PZe15rPfMhllBg-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 534E875A2EC7;
	Sat, 14 Nov 2020 12:57:26 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0Bji90B3dRTC; Sat, 14 Nov 2020 12:57:26 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 31D6F75A0ACC;
	Sat, 14 Nov 2020 12:57:26 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 21FA281B5F5F;
	Sat, 14 Nov 2020 12:57:26 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id KeeGZUmt6BiA; Sat, 14 Nov 2020 12:57:26 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 062BE81B6520;
	Sat, 14 Nov 2020 12:57:26 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bXOgpCKTnoq3; Sat, 14 Nov 2020 12:57:25 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id C076581B5F5F;
	Sat, 14 Nov 2020 12:57:25 +0000 (GMT)
Date: Sat, 14 Nov 2020 12:57:24 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <217712894.87456370.1605358643862.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201113222600.GC1299@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: g/vfeij9eDo1ICtJyNfItBe87fEG+w==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 13 Nov, 2020, at 22:26, bfields bfields@fieldses.org wrote:
> On Fri, Nov 13, 2020 at 09:50:50AM -0500, bfields wrote:
>> On Thu, Nov 12, 2020 at 11:05:57PM +0000, Daire Byrne wrote:
>> > So, I can't lay claim to identifying the exact optimisation/hack that
>> > improves the retention of the re-export server's client cache when
>> > re-exporting an NFSv3 server (which is then read by many clients). We
>> > were working with an engineer at the time who showed an interest in
>> > our use case and after we supplied a reproducer he suggested modifying
>> > the nfs/inode.c
>> > 
>> > -		if (!inode_eq_iversion_raw(inode, fattr->change_attr)) {
>> > +		if (inode_peek_iversion_raw(inode) < fattr->change_attr)
>> > {
>> > 
>> > His reasoning at the time was:
>> > 
>> > "Fixes inode invalidation caused by read access. The least important
>> > bit is ORed with 1 and causes the inode version to differ from the one
>> > seen on the NFS share. This in turn causes unnecessary re-download
>> > impacting the performance significantly. This fix makes it only
>> > re-fetch file content if inode version seen on the server is newer
>> > than the one on the client."
>> > 
>> > But I've always been puzzled by why this only seems to be the case
>> > when using knfsd to re-export the (NFSv3) client mount. Using multiple
>> > processes on a standard client mount never causes any similar
>> > re-validations. And this happens with a completely read-only share
>> > which is why I started to think it has something to do with atimes as
>> > that could perhaps still cause a "write" modification even when
>> > read-only?
>> 
>> Ah-hah!  So, it's inode_query_iversion() that's modifying a nfs inode's
>> i_version.  That's a special thing that only nfsd would do.
>> 
>> I think that's totally fixable, we'll just have to think a little about
>> how....
> 
> I wonder if something like this helps?--b.
> 
> commit 0add88a9ccc5
> Author: J. Bruce Fields <bfields@redhat.com>
> Date:   Fri Nov 13 17:03:04 2020 -0500
> 
>    nfs: don't mangle i_version on NFS
>    
>    The i_version on NFS has pretty much opaque to the client, so we don't
>    want to give the low bit any special interpretation.
>    
>    Define a new FS_PRIVATE_I_VERSION flag for filesystems that manage the
>    i_version on their own.
>    
>    Signed-off-by: J. Bruce Fields <bfields@redhat.com>
> 
> diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
> index 29ec8b09a52d..9b8dd5b713a7 100644
> --- a/fs/nfs/fs_context.c
> +++ b/fs/nfs/fs_context.c
> @@ -1488,7 +1488,8 @@ struct file_system_type nfs_fs_type = {
> 	.init_fs_context	= nfs_init_fs_context,
> 	.parameters		= nfs_fs_parameters,
> 	.kill_sb		= nfs_kill_super,
> -	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA,
> +	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA|
> +				  FS_PRIVATE_I_VERSION,
> };
> MODULE_ALIAS_FS("nfs");
> EXPORT_SYMBOL_GPL(nfs_fs_type);
> @@ -1500,7 +1501,8 @@ struct file_system_type nfs4_fs_type = {
> 	.init_fs_context	= nfs_init_fs_context,
> 	.parameters		= nfs_fs_parameters,
> 	.kill_sb		= nfs_kill_super,
> -	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA,
> +	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA|
> +				  FS_PRIVATE_I_VERSION,
> };
> MODULE_ALIAS_FS("nfs4");
> MODULE_ALIAS("nfs4");
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 21cc971fd960..c5bb4268228b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2217,6 +2217,7 @@ struct file_system_type {
> #define FS_HAS_SUBTYPE		4
> #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
> #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
> +#define FS_PRIVATE_I_VERSION	32	/* i_version managed by filesystem */
> #define FS_THP_SUPPORT		8192	/* Remove once all fs converted */
> #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename()
> internally. */
> 	int (*init_fs_context)(struct fs_context *);
> diff --git a/include/linux/iversion.h b/include/linux/iversion.h
> index 2917ef990d43..52c790a847de 100644
> --- a/include/linux/iversion.h
> +++ b/include/linux/iversion.h
> @@ -307,6 +307,8 @@ inode_query_iversion(struct inode *inode)
> 	u64 cur, old, new;
> 
> 	cur = inode_peek_iversion_raw(inode);
> +	if (inode->i_sb->s_type->fs_flags & FS_PRIVATE_I_VERSION)
> +		return cur;
> 	for (;;) {
> 		/* If flag is already set, then no need to swap */
>  		if (cur & I_VERSION_QUERIED) {

Yes, I can confirm that this absolutely helps! I replaced our (brute force) iversion patch with this (much nicer) patch and we got the same improvement; nfsd and it's clients no longer cause the re-export server's client cache to constantly be re-validated. The re-export server can now serve the same results to many clients from cache. Thanks so much for spending the time to track this down. If merged, future (crazy) NFS re-exporters will benefit from the metadata performance improvement/acceleration!

Now if anyone has any ideas why all the read calls to the originating server are limited to a maximum of 128k (with rsize=1M) when coming via the re-export server's nfsd threads, I see that as the next biggest performance issue. Reading directly on the re-export server with a userspace process issues 1MB reads as expected. It doesn't happen for writes (wsize=1MB all the way through) but I'm not sure if that has more to do with async and write back caching helping to build up the size before commit?

I figure the other remaining items on my (wish) list are probably more in the "won't fix" or "can't fix" category (except maybe the NFSv4.0 input/output errors?).

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

