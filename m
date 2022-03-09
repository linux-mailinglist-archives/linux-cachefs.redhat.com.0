Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D218C4D3BD8
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 22:13:10 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-hemjXyRCNIa6K-UjV2Ncxw-1; Wed, 09 Mar 2022 16:13:07 -0500
X-MC-Unique: hemjXyRCNIa6K-UjV2Ncxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 532E81C0782D;
	Wed,  9 Mar 2022 21:13:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B2B3C50941;
	Wed,  9 Mar 2022 21:13:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C07AB1953564;
	Wed,  9 Mar 2022 21:13:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 152311953541 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 21:13:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E6378111E3E8; Wed,  9 Mar 2022 21:13:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E28111E3E6
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 21:13:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFF3085A5BC
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 21:13:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-XZzqnolQOCKOgWda6mZ2yQ-1; Wed, 09 Mar 2022 16:12:57 -0500
X-MC-Unique: XZzqnolQOCKOgWda6mZ2yQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55568619DA;
 Wed,  9 Mar 2022 21:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFE7C340F4;
 Wed,  9 Mar 2022 21:12:54 +0000 (UTC)
Message-ID: <92ebc9fbdda967c14274f2b246ef3f77a1f21224.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 16:12:52 -0500
In-Reply-To: <164678220204.1200972.17408022517463940584.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678220204.1200972.17408022517463940584.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v2 19/19] afs: Maintain
 netfs_i_context::remote_i_size
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 23:30 +0000, David Howells wrote:
> Make afs use netfslib's tracking for the server's idea of what the current
> inode size is independently of inode->i_size.  We really want to use this
> value when calculating the new vnode size when initiating a StoreData RPC
> op rather than the size stat() presents to the user (ie. inode->i_size) as
> the latter is affected by as-yet uncommitted writes.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> cc: linux-afs@lists.infradead.org
> 
> Link: https://lore.kernel.org/r/164623014626.3564931.8375344024648265358.stgit@warthog.procyon.org.uk/ # v1
> ---
> 
>  fs/afs/inode.c |    1 +
>  fs/afs/write.c |    7 +++----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/afs/inode.c b/fs/afs/inode.c
> index 5b5e40197655..2fe402483ad5 100644
> --- a/fs/afs/inode.c
> +++ b/fs/afs/inode.c
> @@ -246,6 +246,7 @@ static void afs_apply_status(struct afs_operation *op,
>  		 * idea of what the size should be that's not the same as
>  		 * what's on the server.
>  		 */
> +		vnode->netfs_ctx.remote_i_size = status->size;
>  		if (change_size) {
>  			afs_set_i_size(vnode, status->size);
>  			inode->i_ctime = t;
> diff --git a/fs/afs/write.c b/fs/afs/write.c
> index e4b47f67a408..85c9056ba9fb 100644
> --- a/fs/afs/write.c
> +++ b/fs/afs/write.c
> @@ -353,9 +353,10 @@ static const struct afs_operation_ops afs_store_data_operation = {
>  static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos,
>  			  bool laundering)
>  {
> +	struct netfs_i_context *ictx = &vnode->netfs_ctx;
>  	struct afs_operation *op;
>  	struct afs_wb_key *wbk = NULL;
> -	loff_t size = iov_iter_count(iter), i_size;
> +	loff_t size = iov_iter_count(iter);
>  	int ret = -ENOKEY;
>  
>  	_enter("%s{%llx:%llu.%u},%llx,%llx",
> @@ -377,15 +378,13 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t
>  		return -ENOMEM;
>  	}
>  
> -	i_size = i_size_read(&vnode->vfs_inode);
> -
>  	afs_op_set_vnode(op, 0, vnode);
>  	op->file[0].dv_delta = 1;
>  	op->file[0].modification = true;
>  	op->store.write_iter = iter;
>  	op->store.pos = pos;
>  	op->store.size = size;
> -	op->store.i_size = max(pos + size, i_size);
> +	op->store.i_size = max(pos + size, ictx->remote_i_size);

Ahh ok, so if i_size is larger than is represented by this write, you'll
have a zeroed out region until writeback catches up. Makes sense.

>  	op->store.laundering = laundering;
>  	op->mtime = vnode->vfs_inode.i_mtime;
>  	op->flags |= AFS_OPERATION_UNINTR;
> 
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

