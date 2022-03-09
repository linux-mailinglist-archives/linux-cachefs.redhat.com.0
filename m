Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081D4D34F4
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 17:54:57 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-ceuQ5l1IPEuPe4kzq2lpPw-1; Wed, 09 Mar 2022 11:54:53 -0500
X-MC-Unique: ceuQ5l1IPEuPe4kzq2lpPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32C913806721;
	Wed,  9 Mar 2022 16:54:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B26358D84B;
	Wed,  9 Mar 2022 16:54:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4FB4D1953549;
	Wed,  9 Mar 2022 16:54:49 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 360A91953540 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 16:52:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2413440CFD0B; Wed,  9 Mar 2022 16:52:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F89440CFD01
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 16:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07345811E9B
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 16:52:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-3nu4Y_wfNy6MeNl19MKBiw-1; Wed, 09 Mar 2022 11:52:37 -0500
X-MC-Unique: 3nu4Y_wfNy6MeNl19MKBiw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E69661B46;
 Wed,  9 Mar 2022 16:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F6CC340EC;
 Wed,  9 Mar 2022 16:52:33 +0000 (UTC)
Message-ID: <4cbb2bb06eafb8f03135fc377ced779102004ea7.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 11:52:32 -0500
In-Reply-To: <164678212401.1200972.16537041523832944934.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678212401.1200972.16537041523832944934.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v2 11/19] netfs: Change ->init_request()
 to return an error code
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 23:28 +0000, David Howells wrote:
> Change the request initialisation function to return an error code so that
> the network filesystem can return a failure (ENOMEM, for example).
> 
> This will also allow ceph to abort a ->readahead() op if the server refuses
> to give it a cap allowing local caching from within the netfslib framework
> (errors aren't passed back through ->readahead(), so returning, say,
> -ENOBUFS will cause the op to be aborted).
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/9p/vfs_addr.c       |    3 ++-
>  fs/afs/file.c          |    3 ++-
>  fs/netfs/objects.c     |   41 ++++++++++++++++++++++++-----------------
>  fs/netfs/read_helper.c |   20 ++++++++++++--------
>  include/linux/netfs.h  |    2 +-
>  5 files changed, 41 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> index fdc1033a1546..91d3926c9559 100644
> --- a/fs/9p/vfs_addr.c
> +++ b/fs/9p/vfs_addr.c
> @@ -56,12 +56,13 @@ static void v9fs_issue_read(struct netfs_io_subrequest *subreq)
>   * @rreq: The read request
>   * @file: The file being read from
>   */
> -static void v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
> +static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
>  {
>  	struct p9_fid *fid = file->private_data;
>  
>  	refcount_inc(&fid->count);
>  	rreq->netfs_priv = fid;
> +	return 0;
>  }
>  
>  /**
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index b19d635eed12..6469d7f98ef5 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -359,9 +359,10 @@ static int afs_symlink_readpage(struct file *file, struct page *page)
>  	return ret;
>  }
>  
> -static void afs_init_request(struct netfs_io_request *rreq, struct file *file)
> +static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
>  {
>  	rreq->netfs_priv = key_get(afs_file_key(file));
> +	return 0;
>  }
>  
>  static bool afs_is_cache_enabled(struct inode *inode)
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index 986d7a9d25dd..ae18827e156b 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -20,27 +20,34 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>  {
>  	static atomic_t debug_ids;
>  	struct netfs_io_request *rreq;
> +	int ret;
>  
>  	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
> -	if (rreq) {
> -		rreq->start	= start;
> -		rreq->len	= len;
> -		rreq->origin	= origin;
> -		rreq->netfs_ops	= ops;
> -		rreq->netfs_priv = netfs_priv;
> -		rreq->mapping	= mapping;
> -		rreq->inode	= file_inode(file);
> -		rreq->i_size	= i_size_read(rreq->inode);
> -		rreq->debug_id	= atomic_inc_return(&debug_ids);
> -		INIT_LIST_HEAD(&rreq->subrequests);
> -		INIT_WORK(&rreq->work, netfs_rreq_work);
> -		refcount_set(&rreq->ref, 1);
> -		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
> -		if (ops->init_request)
> -			ops->init_request(rreq, file);
> -		netfs_stat(&netfs_n_rh_rreq);
> +	if (!rreq)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rreq->start	= start;
> +	rreq->len	= len;
> +	rreq->origin	= origin;
> +	rreq->netfs_ops	= ops;
> +	rreq->netfs_priv = netfs_priv;
> +	rreq->mapping	= mapping;
> +	rreq->inode	= file_inode(file);
> +	rreq->i_size	= i_size_read(rreq->inode);
> +	rreq->debug_id	= atomic_inc_return(&debug_ids);
> +	INIT_LIST_HEAD(&rreq->subrequests);
> +	INIT_WORK(&rreq->work, netfs_rreq_work);
> +	refcount_set(&rreq->ref, 1);
> +	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
> +	if (rreq->netfs_ops->init_request) {
> +		ret = rreq->netfs_ops->init_request(rreq, file);
> +		if (ret < 0) {
> +			kfree(rreq);
> +			return ERR_PTR(ret);
> +		}
>  	}
>  
> +	netfs_stat(&netfs_n_rh_rreq);
>  	return rreq;
>  }
>  
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index dea085715286..b5176f4320f4 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -768,7 +768,7 @@ void netfs_readahead(struct readahead_control *ractl,
>  				   readahead_pos(ractl),
>  				   readahead_length(ractl),
>  				   NETFS_READAHEAD);
> -	if (!rreq)
> +	if (IS_ERR(rreq))
>  		goto cleanup;
>  
>  	if (ops->begin_cache_operation) {
> @@ -842,11 +842,9 @@ int netfs_readpage(struct file *file,
>  	rreq = netfs_alloc_request(folio->mapping, file, ops, netfs_priv,
>  				   folio_file_pos(folio), folio_size(folio),
>  				   NETFS_READPAGE);
> -	if (!rreq) {
> -		if (netfs_priv)
> -			ops->cleanup(folio_file_mapping(folio), netfs_priv);
> -		folio_unlock(folio);
> -		return -ENOMEM;
> +	if (IS_ERR(rreq)) {
> +		ret = PTR_ERR(rreq);
> +		goto alloc_error;
>  	}
>  
>  	if (ops->begin_cache_operation) {
> @@ -887,6 +885,11 @@ int netfs_readpage(struct file *file,
>  out:
>  	netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
>  	return ret;
> +alloc_error:
> +	if (netfs_priv)
> +		ops->cleanup(folio_file_mapping(folio), netfs_priv);
> +	folio_unlock(folio);
> +	return ret;
>  }
>  EXPORT_SYMBOL(netfs_readpage);
>  
> @@ -1007,12 +1010,13 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  		goto have_folio_no_wait;
>  	}
>  
> -	ret = -ENOMEM;
>  	rreq = netfs_alloc_request(mapping, file, ops, netfs_priv,
>  				   folio_file_pos(folio), folio_size(folio),
>  				   NETFS_READ_FOR_WRITE);
> -	if (!rreq)
> +	if (IS_ERR(rreq)) {
> +		ret = PTR_ERR(rreq);
>  		goto error;
> +	}
>  	rreq->no_unlock_folio	= folio_index(folio);
>  	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
>  	netfs_priv = NULL;
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 7dc741d9b21b..4b99e38f73d9 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -193,7 +193,7 @@ struct netfs_io_request {
>   */
>  struct netfs_request_ops {
>  	bool (*is_cache_enabled)(struct inode *inode);
> -	void (*init_request)(struct netfs_io_request *rreq, struct file *file);
> +	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
>  	int (*begin_cache_operation)(struct netfs_io_request *rreq);
>  	void (*expand_readahead)(struct netfs_io_request *rreq);
>  	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
> 
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

