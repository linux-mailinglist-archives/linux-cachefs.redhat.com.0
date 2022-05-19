Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9E52D877
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 May 2022 17:45:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-D06XxqMUNai_gF3ERFbjRw-1; Thu, 19 May 2022 11:45:32 -0400
X-MC-Unique: D06XxqMUNai_gF3ERFbjRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B15802803;
	Thu, 19 May 2022 15:45:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46F721415100;
	Thu, 19 May 2022 15:45:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0FEFE193F6D5;
	Thu, 19 May 2022 15:45:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05DC0194705A for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 19 May 2022 15:45:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E11B8140EBD5; Thu, 19 May 2022 15:45:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AEB1410F37
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 15:45:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F852811E7A
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 15:45:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-hBEQLsKmNdOmpbRaU-R6mw-1; Thu, 19 May 2022 11:45:28 -0400
X-MC-Unique: hBEQLsKmNdOmpbRaU-R6mw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B955B82520;
 Thu, 19 May 2022 15:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9DDC385AA;
 Thu, 19 May 2022 15:36:08 +0000 (UTC)
Message-ID: <e5f6fee5518ce8e1b4fc5aa7038de1617a341c2f.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Thu, 19 May 2022 11:36:07 -0400
In-Reply-To: <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
References: <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: ->cleanup() op is always
 given a rreq pointer now
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
Cc: linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2022-05-19 at 15:16 +0100, David Howells wrote:
> As the ->init() netfs op is now used to set up the netfslib I/O request
> rather than passing stuff in, thereby allowing the netfslib functions to be
> pointed at directly by the address_space_operations struct, we're always
> going to be able to pass an I/O request pointer to the cleanup function.
> 
> Therefore, change the ->cleanup() function to take a pointer to the I/O
> request rather than taking a pointer to the network filesystem's
> address_space and a piece of private data.
> 
> Also, rename ->cleanup() to ->free_request() to match the ->init_request()
> function.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Steve French <sfrench@samba.org>
> cc: Dominique Martinet <asmadeus@codewreck.org>
> cc: Jeff Layton <jlayton@redhat.com>
> cc: David Wysochanski <dwysocha@redhat.com>
> cc: Ilya Dryomov <idryomov@gmail.com>
> cc: v9fs-developer@lists.sourceforge.net
> cc: ceph-devel@vger.kernel.org
> cc: linux-afs@lists.infradead.org
> cc: linux-cifs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> ---
> 
>  fs/9p/vfs_addr.c      |   11 +++++------
>  fs/afs/file.c         |    6 +++---
>  fs/ceph/addr.c        |    9 ++++-----
>  fs/netfs/objects.c    |    8 +++++---
>  include/linux/netfs.h |    4 +++-
>  5 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> index 501128188343..002c482794dc 100644
> --- a/fs/9p/vfs_addr.c
> +++ b/fs/9p/vfs_addr.c
> @@ -66,13 +66,12 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
>  }
>  
>  /**
> - * v9fs_req_cleanup - Cleanup request initialized by v9fs_init_request
> - * @mapping: unused mapping of request to cleanup
> - * @priv: private data to cleanup, a fid, guaranted non-null.
> + * v9fs_free_request - Cleanup request initialized by v9fs_init_rreq
> + * @rreq: The I/O request to clean up
>   */
> -static void v9fs_req_cleanup(struct address_space *mapping, void *priv)
> +static void v9fs_free_request(struct netfs_io_request *rreq)
>  {
> -	struct p9_fid *fid = priv;
> +	struct p9_fid *fid = rreq->netfs_priv;
>  
>  	p9_client_clunk(fid);
>  }
> @@ -94,9 +93,9 @@ static int v9fs_begin_cache_operation(struct netfs_io_request *rreq)
>  
>  const struct netfs_request_ops v9fs_req_ops = {
>  	.init_request		= v9fs_init_request,
> +	.free_request		= v9fs_free_request,
>  	.begin_cache_operation	= v9fs_begin_cache_operation,
>  	.issue_read		= v9fs_issue_read,
> -	.cleanup		= v9fs_req_cleanup,
>  };
>  
>  /**
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index 26292a110a8f..b9ca72fbbcf9 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -383,17 +383,17 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
>  	return test_bit(AFS_VNODE_DELETED, &vnode->flags) ? -ESTALE : 0;
>  }
>  
> -static void afs_priv_cleanup(struct address_space *mapping, void *netfs_priv)
> +static void afs_free_request(struct netfs_io_request *rreq)
>  {
> -	key_put(netfs_priv);
> +	key_put(rreq->netfs_priv);
>  }
>  
>  const struct netfs_request_ops afs_req_ops = {
>  	.init_request		= afs_init_request,
> +	.free_request		= afs_free_request,
>  	.begin_cache_operation	= afs_begin_cache_operation,
>  	.check_write_begin	= afs_check_write_begin,
>  	.issue_read		= afs_issue_read,
> -	.cleanup		= afs_priv_cleanup,
>  };
>  
>  int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index b6edcf89a429..ee8c1b099c4f 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -392,11 +392,10 @@ static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
>  	return 0;
>  }
>  
> -static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
> +static void ceph_netfs_free_request(struct netfs_io_request *rreq)
>  {
> -	struct inode *inode = mapping->host;
> -	struct ceph_inode_info *ci = ceph_inode(inode);
> -	int got = (uintptr_t)priv;
> +	struct ceph_inode_info *ci = ceph_inode(rreq->inode);
> +	int got = (uintptr_t)rreq->netfs_priv;
>  
>  	if (got)
>  		ceph_put_cap_refs(ci, got);
> @@ -404,12 +403,12 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  
>  const struct netfs_request_ops ceph_netfs_ops = {
>  	.init_request		= ceph_init_request,
> +	.free_request		= ceph_netfs_free_request,
>  	.begin_cache_operation	= ceph_begin_cache_operation,
>  	.issue_read		= ceph_netfs_issue_read,
>  	.expand_readahead	= ceph_netfs_expand_readahead,
>  	.clamp_length		= ceph_netfs_clamp_length,
>  	.check_write_begin	= ceph_netfs_check_write_begin,
> -	.cleanup		= ceph_readahead_cleanup,
>  };
>  
>  #ifdef CONFIG_CEPH_FSCACHE
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index e86107b30ba4..d6b8c0cbeb7c 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -75,10 +75,10 @@ static void netfs_free_request(struct work_struct *work)
>  	struct netfs_io_request *rreq =
>  		container_of(work, struct netfs_io_request, work);
>  
> -	netfs_clear_subrequests(rreq, false);
> -	if (rreq->netfs_priv)
> -		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
>  	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
> +	netfs_clear_subrequests(rreq, false);
> +	if (rreq->netfs_ops->free_request)
> +		rreq->netfs_ops->free_request(rreq);
>  	if (rreq->cache_resources.ops)
>  		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
>  	kfree(rreq);
> @@ -140,6 +140,8 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
>  	struct netfs_io_request *rreq = subreq->rreq;
>  
>  	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
> +	if (rreq->netfs_ops->free_subrequest)
> +		rreq->netfs_ops->free_subrequest(subreq);
>  	kfree(subreq);
>  	netfs_stat_d(&netfs_n_rh_sreq);
>  	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index c7bf1eaf51d5..1970c21b4f80 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -204,7 +204,10 @@ struct netfs_io_request {
>   */
>  struct netfs_request_ops {
>  	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
> +	void (*free_request)(struct netfs_io_request *rreq);
> +	void (*free_subrequest)(struct netfs_io_subrequest *rreq);

Do we need free_subrequest? It looks like nothing defines it in this
series.

>  	int (*begin_cache_operation)(struct netfs_io_request *rreq);
> +
>  	void (*expand_readahead)(struct netfs_io_request *rreq);
>  	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
>  	void (*issue_read)(struct netfs_io_subrequest *subreq);
> @@ -212,7 +215,6 @@ struct netfs_request_ops {
>  	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
>  				 struct folio *folio, void **_fsdata);
>  	void (*done)(struct netfs_io_request *rreq);
> -	void (*cleanup)(struct address_space *mapping, void *netfs_priv);
>  };
>  
>  /*
> 
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

