Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DE4D3B4F
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 21:45:18 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-2PBkbuO1OEi4zgYmUTsKSw-1; Wed, 09 Mar 2022 15:45:15 -0500
X-MC-Unique: 2PBkbuO1OEi4zgYmUTsKSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71D3A101AA42;
	Wed,  9 Mar 2022 20:45:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32B70C08097;
	Wed,  9 Mar 2022 20:45:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C0EE91953563;
	Wed,  9 Mar 2022 20:45:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CFD441953540 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 20:45:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD27B463EAA; Wed,  9 Mar 2022 20:45:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B91E4401E4E
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 20:45:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32A942999B5F
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 20:45:12 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-KMBhuxLLNByACcM21xQufA-1; Wed, 09 Mar 2022 15:45:08 -0500
X-MC-Unique: KMBhuxLLNByACcM21xQufA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9263B82396;
 Wed,  9 Mar 2022 20:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6BCC340EC;
 Wed,  9 Mar 2022 20:45:04 +0000 (UTC)
Message-ID: <2ebfd2f772ceef605896e58bbd0e733e1413ff71.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 15:45:02 -0500
In-Reply-To: <164678219305.1200972.6459431995188365134.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678219305.1200972.6459431995188365134.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v2 18/19] netfs: Keep track of the
 actual remote file size
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
 linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
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

On Tue, 2022-03-08 at 23:29 +0000, David Howells wrote:
> Provide a place in which to keep track of the actual remote file size in
> the netfs context.  This is needed because inode->i_size will be updated as
> we buffer writes in the pagecache, but the server file size won't get
> updated until we flush them back.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> 
> Link: https://lore.kernel.org/r/164623013727.3564931.17659955636985232717.stgit@warthog.procyon.org.uk/ # v1
> ---
> 
>  include/linux/netfs.h |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 8458b30172a5..c7bf1eaf51d5 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -126,6 +126,7 @@ struct netfs_i_context {
>  #if IS_ENABLED(CONFIG_FSCACHE)
>  	struct fscache_cookie	*cache;
>  #endif
> +	loff_t			remote_i_size;	/* Size of the remote file */
>  };
>  
>  /*
> @@ -324,6 +325,21 @@ static inline void netfs_i_context_init(struct inode *inode,
>  
>  	memset(ctx, 0, sizeof(*ctx));
>  	ctx->ops = ops;
> +	ctx->remote_i_size = i_size_read(inode);
> +}
> +
> +/**
> + * netfs_resize_file - Note that a file got resized
> + * @inode: The inode being resized
> + * @new_i_size: The new file size
> + *
> + * Inform the netfs lib that a file got resized so that it can adjust its state.
> + */
> +static inline void netfs_resize_file(struct inode *inode, loff_t new_i_size)
> +{
> +	struct netfs_i_context *ctx = netfs_i_context(inode);
> +
> +	ctx->remote_i_size = new_i_size;
>  }
>  
>  /**
> 
> 

This seems like something useful, but I wonder if it'll need some sort
of serialization vs. concurrent updates. Can we assume that netfs itself
will never call netfs_resize_file?

Ceph already has some pretty complicated size tracking, since it can get
async notifications of size changes from the MDS. We'll have to consider
how to integrate this with what it does. Probably this will replace one
(or more?) of its fields.

We may need to offer up some guidance wrt locking.

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

