Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7022B2883
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Nov 2020 23:26:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-BeBq-dt0M06IKpfCRo9xTQ-1; Fri, 13 Nov 2020 17:26:20 -0500
X-MC-Unique: BeBq-dt0M06IKpfCRo9xTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4440A1006C8A;
	Fri, 13 Nov 2020 22:26:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 989655D9E8;
	Fri, 13 Nov 2020 22:26:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2012958103;
	Fri, 13 Nov 2020 22:26:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADMQ7qr000740 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 17:26:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D600D2156A34; Fri, 13 Nov 2020 22:26:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0AAD2156A52
	for <linux-cachefs@redhat.com>; Fri, 13 Nov 2020 22:26:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 629AF185A78B
	for <linux-cachefs@redhat.com>; Fri, 13 Nov 2020 22:26:04 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-168-Np9VnCB_NNiaf7oS7kUa8Q-1;
	Fri, 13 Nov 2020 17:26:01 -0500
X-MC-Unique: Np9VnCB_NNiaf7oS7kUa8Q-1
Received: by fieldses.org (Postfix, from userid 2815)
	id E2747BC8; Fri, 13 Nov 2020 17:26:00 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org E2747BC8
Date: Fri, 13 Nov 2020 17:26:00 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201113222600.GC1299@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
MIME-Version: 1.0
In-Reply-To: <20201113145050.GB1299@fieldses.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 13, 2020 at 09:50:50AM -0500, bfields wrote:
> On Thu, Nov 12, 2020 at 11:05:57PM +0000, Daire Byrne wrote:
> > So, I can't lay claim to identifying the exact optimisation/hack that
> > improves the retention of the re-export server's client cache when
> > re-exporting an NFSv3 server (which is then read by many clients). We
> > were working with an engineer at the time who showed an interest in
> > our use case and after we supplied a reproducer he suggested modifying
> > the nfs/inode.c
> > 
> > -		if (!inode_eq_iversion_raw(inode, fattr->change_attr)) {
> > +		if (inode_peek_iversion_raw(inode) < fattr->change_attr)
> > {
> > 
> > His reasoning at the time was:
> > 
> > "Fixes inode invalidation caused by read access. The least important
> > bit is ORed with 1 and causes the inode version to differ from the one
> > seen on the NFS share. This in turn causes unnecessary re-download
> > impacting the performance significantly. This fix makes it only
> > re-fetch file content if inode version seen on the server is newer
> > than the one on the client."
> > 
> > But I've always been puzzled by why this only seems to be the case
> > when using knfsd to re-export the (NFSv3) client mount. Using multiple
> > processes on a standard client mount never causes any similar
> > re-validations. And this happens with a completely read-only share
> > which is why I started to think it has something to do with atimes as
> > that could perhaps still cause a "write" modification even when
> > read-only?
> 
> Ah-hah!  So, it's inode_query_iversion() that's modifying a nfs inode's
> i_version.  That's a special thing that only nfsd would do.
> 
> I think that's totally fixable, we'll just have to think a little about
> how....

I wonder if something like this helps?--b.

commit 0add88a9ccc5
Author: J. Bruce Fields <bfields@redhat.com>
Date:   Fri Nov 13 17:03:04 2020 -0500

    nfs: don't mangle i_version on NFS
    
    The i_version on NFS has pretty much opaque to the client, so we don't
    want to give the low bit any special interpretation.
    
    Define a new FS_PRIVATE_I_VERSION flag for filesystems that manage the
    i_version on their own.
    
    Signed-off-by: J. Bruce Fields <bfields@redhat.com>

diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
index 29ec8b09a52d..9b8dd5b713a7 100644
--- a/fs/nfs/fs_context.c
+++ b/fs/nfs/fs_context.c
@@ -1488,7 +1488,8 @@ struct file_system_type nfs_fs_type = {
 	.init_fs_context	= nfs_init_fs_context,
 	.parameters		= nfs_fs_parameters,
 	.kill_sb		= nfs_kill_super,
-	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA,
+	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA|
+				  FS_PRIVATE_I_VERSION,
 };
 MODULE_ALIAS_FS("nfs");
 EXPORT_SYMBOL_GPL(nfs_fs_type);
@@ -1500,7 +1501,8 @@ struct file_system_type nfs4_fs_type = {
 	.init_fs_context	= nfs_init_fs_context,
 	.parameters		= nfs_fs_parameters,
 	.kill_sb		= nfs_kill_super,
-	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA,
+	.fs_flags		= FS_RENAME_DOES_D_MOVE|FS_BINARY_MOUNTDATA|
+				  FS_PRIVATE_I_VERSION,
 };
 MODULE_ALIAS_FS("nfs4");
 MODULE_ALIAS("nfs4");
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 21cc971fd960..c5bb4268228b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2217,6 +2217,7 @@ struct file_system_type {
 #define FS_HAS_SUBTYPE		4
 #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
 #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
+#define FS_PRIVATE_I_VERSION	32	/* i_version managed by filesystem */
 #define FS_THP_SUPPORT		8192	/* Remove once all fs converted */
 #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
 	int (*init_fs_context)(struct fs_context *);
diff --git a/include/linux/iversion.h b/include/linux/iversion.h
index 2917ef990d43..52c790a847de 100644
--- a/include/linux/iversion.h
+++ b/include/linux/iversion.h
@@ -307,6 +307,8 @@ inode_query_iversion(struct inode *inode)
 	u64 cur, old, new;
 
 	cur = inode_peek_iversion_raw(inode);
+	if (inode->i_sb->s_type->fs_flags & FS_PRIVATE_I_VERSION)
+		return cur;
 	for (;;) {
 		/* If flag is already set, then no need to swap */
 		if (cur & I_VERSION_QUERIED) {

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

