Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC8033F8AB0
	for <lists+linux-cachefs@lfdr.de>; Thu, 26 Aug 2021 17:06:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-QmDW76-zNa-2n_aFh5PtEQ-1; Thu, 26 Aug 2021 11:06:47 -0400
X-MC-Unique: QmDW76-zNa-2n_aFh5PtEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6657E102620A;
	Thu, 26 Aug 2021 15:06:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E3160583;
	Thu, 26 Aug 2021 15:06:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2A6E4BB7C;
	Thu, 26 Aug 2021 15:06:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17QF6haq031446 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 26 Aug 2021 11:06:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13313200E67E; Thu, 26 Aug 2021 15:06:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB3320285AC
	for <linux-cachefs@redhat.com>; Thu, 26 Aug 2021 15:06:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5C8588647F
	for <linux-cachefs@redhat.com>; Thu, 26 Aug 2021 15:06:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-453-NQXTqEIdOi-2fsy_ItByGQ-1;
	Thu, 26 Aug 2021 11:06:35 -0400
X-MC-Unique: NQXTqEIdOi-2fsy_ItByGQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D27160F4C;
	Thu, 26 Aug 2021 15:06:34 +0000 (UTC)
Message-ID: <be9c43988a98f2b30bbc3820356fa4c30008b4da.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Thu, 26 Aug 2021 11:06:33 -0400
In-Reply-To: <2295996.1629990058@warthog.procyon.org.uk>
References: <20210826132443.64047-2-jlayton@kernel.org>
	<20210826132443.64047-1-jlayton@kernel.org>
	<2295996.1629990058@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
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
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: refactor arguments for
 netfs_alloc_read_request
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
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

On Thu, 2021-08-26 at 16:00 +0100, David Howells wrote:
> Below is my take on this.  I've moved it earlier in the patchset, so some bits
> have migrated to other patches.
> 
> ---
> commit b32c31951d58c605a0993da59de0132cb5ef0723
> Author: Jeff Layton <jlayton@kernel.org>
> Date:   Thu Aug 26 09:24:42 2021 -0400
> 
>     netfs: refactor arguments for netfs_alloc_read_request
>     
>     Pass start and len to the rreq allocator. This should ensure that the
>     fields are set so that init_rreq can use them.
>     
>     Also add a parameter to indicates the origin of the request.  Ceph can use
>     this to tell whether to get caps.
>     
>     Signed-off-by: Jeff Layton <jlayton@kernel.org>
>     Signed-off-by: David Howells <dhowells@redhat.com>
> 
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index b4122653c259..19eb114ebf2a 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -29,8 +29,11 @@ MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
>  static void netfs_rreq_work(struct work_struct *);
>  static void netfs_rreq_clear_buffer(struct netfs_read_request *);
>  
> -static struct netfs_read_request *netfs_alloc_read_request(struct address_space *mapping,
> -							   struct file *file)
> +static struct netfs_read_request *netfs_alloc_read_request(
> +	struct address_space *mapping,
> +	struct file *file,
> +	loff_t start, size_t len,
> +	enum netfs_read_origin origin)
>  {
>  	static atomic_t debug_ids;
>  	struct inode *inode = file ? file_inode(file) : mapping->host;
> @@ -39,8 +42,11 @@ static struct netfs_read_request *netfs_alloc_read_request(struct address_space
>  
>  	rreq = kzalloc(sizeof(struct netfs_read_request), GFP_KERNEL);
>  	if (rreq) {
> +		rreq->start	= start;
> +		rreq->len	= len;
>  		rreq->mapping	= mapping;
>  		rreq->inode	= inode;
> +		rreq->origin	= origin;
>  		rreq->netfs_ops	= ctx->ops;
>  		rreq->i_size	= i_size_read(inode);
>  		rreq->debug_id	= atomic_inc_return(&debug_ids);
> @@ -1026,11 +1032,12 @@ void netfs_readahead(struct readahead_control *ractl)
>  	if (readahead_count(ractl) == 0)
>  		return;
>  
> -	rreq = netfs_alloc_read_request(ractl->mapping, ractl->file);
> +	rreq = netfs_alloc_read_request(ractl->mapping, ractl->file,
> +					readahead_pos(ractl),
> +					readahead_length(ractl),
> +					NETFS_READAHEAD);
>  	if (!rreq)
>  		return;
> -	rreq->start	= readahead_pos(ractl);
> -	rreq->len	= readahead_length(ractl);
>  
>  	ret = netfs_begin_cache_operation(rreq, ctx);
>  	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
> @@ -1091,11 +1098,10 @@ int netfs_readpage(struct file *file, struct page *subpage)
>  
>  	_enter("%lx", folio_index(folio));
>  
> -	rreq = netfs_alloc_read_request(mapping, file);
> +	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
> +					folio_size(folio), NETFS_SYNC_READ);
>  	if (!rreq)
>  		goto nomem;
> -	rreq->start	= folio_file_pos(folio);
> -	rreq->len	= folio_size(folio);
>  
>  	ret = netfs_begin_cache_operation(rreq, ctx);
>  	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
> @@ -1272,7 +1278,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	}
>  
>  	ret = -ENOMEM;
> -	rreq = netfs_alloc_read_request(mapping, file);
> +	rreq = netfs_alloc_read_request(mapping, file, folio_file_pos(folio),
> +					folio_size(folio), NETFS_READ_FOR_WRITE);
>  	if (!rreq)
>  		goto error;
>  	rreq->start		= folio_file_pos(folio);
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index cd572bf1dfa3..210f9414747c 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -168,6 +168,12 @@ struct netfs_read_subrequest {
>  #define NETFS_SREQ_NO_PROGRESS		4	/* Set if we didn't manage to read any data */
>  };
>  
> +enum netfs_read_origin {
> +	NETFS_READAHEAD,		/* This read was triggered by readahead */
> +	NETFS_SYNC_READ,		/* This read is a synchronous read */
> +	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
> +} __mode(byte);
> +
>  /*
>   * Descriptor for a read helper request.  This is used to make multiple I/O
>   * requests on a variety of sources and then stitch the result together.
> @@ -186,6 +192,7 @@ struct netfs_read_request {
>  	size_t			submitted;	/* Amount submitted for I/O so far */
>  	size_t			len;		/* Length of the request */
>  	short			error;		/* 0 or error that occurred */
> +	enum netfs_read_origin	origin;		/* Origin of the read */
>  	loff_t			i_size;		/* Size of the file */
>  	loff_t			start;		/* Start position */
>  	pgoff_t			no_unlock_folio; /* Don't unlock this folio after read */
> 

LGTM

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

