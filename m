Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A14D38AD
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 19:23:07 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-8tvqGy7nN1KbkDJL1dXChg-1; Wed, 09 Mar 2022 13:23:03 -0500
X-MC-Unique: 8tvqGy7nN1KbkDJL1dXChg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F27718047D6;
	Wed,  9 Mar 2022 18:23:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C1BD401DBE;
	Wed,  9 Mar 2022 18:23:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D6E31953553;
	Wed,  9 Mar 2022 18:23:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 20A891953541 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 18:22:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 024CE4010E95; Wed,  9 Mar 2022 18:22:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F14F040CFD01
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 18:22:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB8DC85A5BC
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 18:22:58 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-IkjaRi3YP3ivCOBgbt8MQA-1; Wed, 09 Mar 2022 13:22:56 -0500
X-MC-Unique: IkjaRi3YP3ivCOBgbt8MQA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D4DAB8228D;
 Wed,  9 Mar 2022 18:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D981BC340E8;
 Wed,  9 Mar 2022 18:22:51 +0000 (UTC)
Message-ID: <8af0d47f17d89c06bbf602496dd845f2b0bf25b3.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 13:22:50 -0500
In-Reply-To: <164678213320.1200972.16807551936267647470.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678213320.1200972.16807551936267647470.stgit@warthog.procyon.org.uk>
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
Subject: Re: [Linux-cachefs] [PATCH v2 12/19] netfs: Add a netfs inode
 context
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 23:28 +0000, David Howells wrote:
> Add a netfs_i_context struct that should be included in the network
> filesystem's own inode struct wrapper, directly after the VFS's inode
> struct, e.g.:
> 
> 	struct my_inode {
> 		struct {
> 			struct inode		vfs_inode;
> 			struct netfs_i_context	netfs_ctx;
> 		};

This seems a bit klunky.

I think it'd be better encapsulation to give this struct a name (e.g.
netfs_inode) and then have the filesystems replace the embedded
vfs_inode with a netfs_inode.

That way it's still just pointer math to get to the context from the
inode and vice versa, but the replacement seems a bit cleaner.

It might mean a bit more churn in the filesystems themselves as you
convert them, but most of them use macros or inline functions as
accessors so it shouldn't be _too_ bad.

> 	};
> 
> The netfs_i_context struct so far contains a single field for the network
> filesystem to use - the cache cookie:
> 
> 	struct netfs_i_context {
> 		...
> 		struct fscache_cookie	*cache;
> 	};
> 
> Three functions are provided to help with this:
> 
>  (1) void netfs_i_context_init(struct inode *inode,
> 			       const struct netfs_request_ops *ops);
> 
>      Initialise the netfs context and set the operations.
> 
>  (2) struct netfs_i_context *netfs_i_context(struct inode *inode);
> 
>      Find the netfs context from the VFS inode.
> 
>  (3) struct inode *netfs_inode(struct netfs_i_context *ctx);
> 
>      Find the VFS inode from the netfs context.
> 
> Changes
> =======
> ver #2)
>  - Adjust documentation to match.
>  - Use "#if IS_ENABLED()" in netfs_i_cookie(), not "#ifdef".
>  - Move the cap check from ceph_readahead() to ceph_init_request() to be
>    called from netfslib.
>  - Remove ceph_readahead() and use  netfs_readahead() directly instead.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> 
> Link: https://lore.kernel.org/r/164622984545.3564931.15691742939278418580.stgit@warthog.procyon.org.uk/ # v1
> ---
> 
>  Documentation/filesystems/netfs_library.rst |  100 +++++++++++++++++++--------
>  fs/9p/cache.c                               |   10 +--
>  fs/9p/v9fs.c                                |    4 -
>  fs/9p/v9fs.h                                |   12 ++-
>  fs/9p/vfs_addr.c                            |   43 +-----------
>  fs/9p/vfs_inode.c                           |   13 +++-
>  fs/afs/dynroot.c                            |    1 
>  fs/afs/file.c                               |   26 +------
>  fs/afs/inode.c                              |   31 +++++---
>  fs/afs/internal.h                           |   19 ++++-
>  fs/afs/super.c                              |    4 -
>  fs/afs/write.c                              |    3 -
>  fs/ceph/addr.c                              |   95 +++++++++++---------------
>  fs/ceph/cache.c                             |   28 ++++----
>  fs/ceph/cache.h                             |   11 ---
>  fs/ceph/inode.c                             |    6 +-
>  fs/ceph/super.h                             |   16 ++--
>  fs/cifs/cifsglob.h                          |   10 ++-
>  fs/cifs/fscache.c                           |   11 ++-
>  fs/cifs/fscache.h                           |    2 -
>  fs/netfs/internal.h                         |   17 ++++-
>  fs/netfs/objects.c                          |   12 ++-
>  fs/netfs/read_helper.c                      |  100 ++++++++++++---------------
>  fs/netfs/stats.c                            |    1 
>  include/linux/netfs.h                       |   81 +++++++++++++++++++---
>  25 files changed, 351 insertions(+), 305 deletions(-)
> 
> diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
> index 4eb7e7b7b0fc..dc716415c7a2 100644
> --- a/Documentation/filesystems/netfs_library.rst
> +++ b/Documentation/filesystems/netfs_library.rst
> @@ -7,6 +7,8 @@ Network Filesystem Helper Library
>  .. Contents:
>  
>   - Overview.
> + - Per-inode context.
> +   - Inode context helper functions.
>   - Buffered read helpers.
>     - Read helper functions.
>     - Read helper structures.
> @@ -28,6 +30,68 @@ Note that the library module doesn't link against local caching directly, so
>  access must be provided by the netfs.
>  
>  
> +Per-Inode Context
> +=================
> +
> +The network filesystem helper library needs a place to store a bit of state for
> +its use on each netfs inode it is helping to manage.  To this end, a context
> +structure is defined::
> +
> +	struct netfs_i_context {
> +		const struct netfs_request_ops *ops;
> +		struct fscache_cookie	*cache;
> +	};
> +
> +A network filesystem that wants to use netfs lib must place one of these
> +directly after the VFS ``struct inode`` it allocates, usually as part of its
> +own struct.  This can be done in a way similar to the following::
> +
> +	struct my_inode {
> +		struct {
> +			struct inode		vfs_inode;
> +			struct netfs_i_context  netfs_ctx;
> +		};
> +		...
> +	};
> +
> +This allows netfslib to find its state by simple offset from the inode pointer,
> +thereby allowing the netfslib helper functions to be pointed to directly by the
> +VFS/VM operation tables.
> +
> +The structure contains the following fields:
> +
> + * ``ops``
> +
> +   The set of operations provided by the network filesystem to netfslib.
> +
> + * ``cache``
> +
> +   Local caching cookie, or NULL if no caching is enabled.  This field does not
> +   exist if fscache is disabled.
> +
> +
> +Inode Context Helper Functions
> +------------------------------
> +
> +To help deal with the per-inode context, a number helper functions are
> +provided.  Firstly, a function to perform basic initialisation on a context and
> +set the operations table pointer::
> +
> +	void netfs_i_context_init(struct inode *inode,
> +				  const struct netfs_request_ops *ops);
> +
> +then two functions to cast between the VFS inode structure and the netfs
> +context::
> +
> +	struct netfs_i_context *netfs_i_context(struct inode *inode);
> +	struct inode *netfs_inode(struct netfs_i_context *ctx);
> +
> +and finally, a function to get the cache cookie pointer from the context
> +attached to an inode (or NULL if fscache is disabled)::
> +
> +	struct fscache_cookie *netfs_i_cookie(struct inode *inode);
> +
> +
>  Buffered Read Helpers
>  =====================
>  
> @@ -70,38 +134,22 @@ Read Helper Functions
>  
>  Three read helpers are provided::
>  
> -	void netfs_readahead(struct readahead_control *ractl,
> -			     const struct netfs_request_ops *ops,
> -			     void *netfs_priv);
> +	void netfs_readahead(struct readahead_control *ractl);
>  	int netfs_readpage(struct file *file,
> -			   struct folio *folio,
> -			   const struct netfs_request_ops *ops,
> -			   void *netfs_priv);
> +			   struct page *page);
>  	int netfs_write_begin(struct file *file,
>  			      struct address_space *mapping,
>  			      loff_t pos,
>  			      unsigned int len,
>  			      unsigned int flags,
>  			      struct folio **_folio,
> -			      void **_fsdata,
> -			      const struct netfs_request_ops *ops,
> -			      void *netfs_priv);
> -
> -Each corresponds to a VM operation, with the addition of a couple of parameters
> -for the use of the read helpers:
> +			      void **_fsdata);
>  
> - * ``ops``
> -
> -   A table of operations through which the helpers can talk to the filesystem.
> -
> - * ``netfs_priv``
> +Each corresponds to a VM address space operation.  These operations use the
> +state in the per-inode context.
>  
> -   Filesystem private data (can be NULL).
> -
> -Both of these values will be stored into the read request structure.
> -
> -For ->readahead() and ->readpage(), the network filesystem should just jump
> -into the corresponding read helper; whereas for ->write_begin(), it may be a
> +For ->readahead() and ->readpage(), the network filesystem just point directly
> +at the corresponding read helper; whereas for ->write_begin(), it may be a
>  little more complicated as the network filesystem might want to flush
>  conflicting writes or track dirty data and needs to put the acquired folio if
>  an error occurs after calling the helper.
> @@ -246,7 +294,6 @@ through which it can issue requests and negotiate::
>  
>  	struct netfs_request_ops {
>  		void (*init_request)(struct netfs_io_request *rreq, struct file *file);
> -		bool (*is_cache_enabled)(struct inode *inode);
>  		int (*begin_cache_operation)(struct netfs_io_request *rreq);
>  		void (*expand_readahead)(struct netfs_io_request *rreq);
>  		bool (*clamp_length)(struct netfs_io_subrequest *subreq);
> @@ -265,11 +312,6 @@ The operations are as follows:
>     [Optional] This is called to initialise the request structure.  It is given
>     the file for reference and can modify the ->netfs_priv value.
>  
> - * ``is_cache_enabled()``
> -
> -   [Required] This is called by netfs_write_begin() to ask if the file is being
> -   cached.  It should return true if it is being cached and false otherwise.
> -
>   * ``begin_cache_operation()``
>  
>     [Optional] This is called to ask the network filesystem to call into the
> diff --git a/fs/9p/cache.c b/fs/9p/cache.c
> index 55e108e5e133..1c8dc696d516 100644
> --- a/fs/9p/cache.c
> +++ b/fs/9p/cache.c
> @@ -49,22 +49,20 @@ int v9fs_cache_session_get_cookie(struct v9fs_session_info *v9ses,
>  
>  void v9fs_cache_inode_get_cookie(struct inode *inode)
>  {
> -	struct v9fs_inode *v9inode;
> +	struct v9fs_inode *v9inode = V9FS_I(inode);
>  	struct v9fs_session_info *v9ses;
>  	__le32 version;
>  	__le64 path;
>  
>  	if (!S_ISREG(inode->i_mode))
>  		return;
> -
> -	v9inode = V9FS_I(inode);
> -	if (WARN_ON(v9inode->fscache))
> +	if (WARN_ON(v9fs_inode_cookie(v9inode)))
>  		return;
>  
>  	version = cpu_to_le32(v9inode->qid.version);
>  	path = cpu_to_le64(v9inode->qid.path);
>  	v9ses = v9fs_inode2v9ses(inode);
> -	v9inode->fscache =
> +	v9inode->netfs_ctx.cache =
>  		fscache_acquire_cookie(v9fs_session_cache(v9ses),
>  				       0,
>  				       &path, sizeof(path),
> @@ -72,5 +70,5 @@ void v9fs_cache_inode_get_cookie(struct inode *inode)
>  				       i_size_read(&v9inode->vfs_inode));
>  
>  	p9_debug(P9_DEBUG_FSC, "inode %p get cookie %p\n",
> -		 inode, v9inode->fscache);
> +		 inode, v9fs_inode_cookie(v9inode));
>  }
> diff --git a/fs/9p/v9fs.c b/fs/9p/v9fs.c
> index 08f65c40af4f..e28ddf763b3b 100644
> --- a/fs/9p/v9fs.c
> +++ b/fs/9p/v9fs.c
> @@ -623,9 +623,7 @@ static void v9fs_sysfs_cleanup(void)
>  static void v9fs_inode_init_once(void *foo)
>  {
>  	struct v9fs_inode *v9inode = (struct v9fs_inode *)foo;
> -#ifdef CONFIG_9P_FSCACHE
> -	v9inode->fscache = NULL;
> -#endif
> +
>  	memset(&v9inode->qid, 0, sizeof(v9inode->qid));
>  	inode_init_once(&v9inode->vfs_inode);
>  }
> diff --git a/fs/9p/v9fs.h b/fs/9p/v9fs.h
> index bc8b30205d36..8a8d363dfdab 100644
> --- a/fs/9p/v9fs.h
> +++ b/fs/9p/v9fs.h
> @@ -9,6 +9,7 @@
>  #define FS_9P_V9FS_H
>  
>  #include <linux/backing-dev.h>
> +#include <linux/netfs.h>
>  
>  /**
>   * enum p9_session_flags - option flags for each 9P session
> @@ -108,14 +109,14 @@ struct v9fs_session_info {
>  #define V9FS_INO_INVALID_ATTR 0x01
>  
>  struct v9fs_inode {
> -#ifdef CONFIG_9P_FSCACHE
> -	struct fscache_cookie *fscache;
> -#endif
> +	struct {
> +		struct inode	vfs_inode;	/* the VFS's inode record */
> +		struct netfs_i_context netfs_ctx; /* Netfslib context */
> +	};
>  	struct p9_qid qid;
>  	unsigned int cache_validity;
>  	struct p9_fid *writeback_fid;
>  	struct mutex v_mutex;
> -	struct inode vfs_inode;
>  };
>  
>  static inline struct v9fs_inode *V9FS_I(const struct inode *inode)
> @@ -126,7 +127,7 @@ static inline struct v9fs_inode *V9FS_I(const struct inode *inode)
>  static inline struct fscache_cookie *v9fs_inode_cookie(struct v9fs_inode *v9inode)
>  {
>  #ifdef CONFIG_9P_FSCACHE
> -	return v9inode->fscache;
> +	return netfs_i_cookie(&v9inode->vfs_inode);
>  #else
>  	return NULL;
>  #endif
> @@ -163,6 +164,7 @@ extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
>  extern const struct inode_operations v9fs_dir_inode_operations_dotl;
>  extern const struct inode_operations v9fs_file_inode_operations_dotl;
>  extern const struct inode_operations v9fs_symlink_inode_operations_dotl;
> +extern const struct netfs_request_ops v9fs_req_ops;
>  extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
>  					      struct p9_fid *fid,
>  					      struct super_block *sb, int new);
> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> index 91d3926c9559..ed06f3c34e98 100644
> --- a/fs/9p/vfs_addr.c
> +++ b/fs/9p/vfs_addr.c
> @@ -77,17 +77,6 @@ static void v9fs_req_cleanup(struct address_space *mapping, void *priv)
>  	p9_client_clunk(fid);
>  }
>  
> -/**
> - * v9fs_is_cache_enabled - Determine if caching is enabled for an inode
> - * @inode: The inode to check
> - */
> -static bool v9fs_is_cache_enabled(struct inode *inode)
> -{
> -	struct fscache_cookie *cookie = v9fs_inode_cookie(V9FS_I(inode));
> -
> -	return fscache_cookie_enabled(cookie) && cookie->cache_priv;
> -}
> -
>  /**
>   * v9fs_begin_cache_operation - Begin a cache operation for a read
>   * @rreq: The read request
> @@ -103,36 +92,13 @@ static int v9fs_begin_cache_operation(struct netfs_io_request *rreq)
>  #endif
>  }
>  
> -static const struct netfs_request_ops v9fs_req_ops = {
> +const struct netfs_request_ops v9fs_req_ops = {
>  	.init_request		= v9fs_init_request,
> -	.is_cache_enabled	= v9fs_is_cache_enabled,
>  	.begin_cache_operation	= v9fs_begin_cache_operation,
>  	.issue_read		= v9fs_issue_read,
>  	.cleanup		= v9fs_req_cleanup,
>  };
>  
> -/**
> - * v9fs_vfs_readpage - read an entire page in from 9P
> - * @file: file being read
> - * @page: structure to page
> - *
> - */
> -static int v9fs_vfs_readpage(struct file *file, struct page *page)
> -{
> -	struct folio *folio = page_folio(page);
> -
> -	return netfs_readpage(file, folio, &v9fs_req_ops, NULL);
> -}
> -
> -/**
> - * v9fs_vfs_readahead - read a set of pages from 9P
> - * @ractl: The readahead parameters
> - */
> -static void v9fs_vfs_readahead(struct readahead_control *ractl)
> -{
> -	netfs_readahead(ractl, &v9fs_req_ops, NULL);
> -}
> -
>  /**
>   * v9fs_release_page - release the private state associated with a page
>   * @page: The page to be released
> @@ -326,8 +292,7 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
>  	 * file.  We need to do this before we get a lock on the page in case
>  	 * there's more than one writer competing for the same cache block.
>  	 */
> -	retval = netfs_write_begin(filp, mapping, pos, len, flags, &folio, fsdata,
> -				   &v9fs_req_ops, NULL);
> +	retval = netfs_write_begin(filp, mapping, pos, len, flags, &folio, fsdata);
>  	if (retval < 0)
>  		return retval;
>  
> @@ -388,8 +353,8 @@ static int v9fs_set_page_dirty(struct page *page)
>  #endif
>  
>  const struct address_space_operations v9fs_addr_operations = {
> -	.readpage = v9fs_vfs_readpage,
> -	.readahead = v9fs_vfs_readahead,
> +	.readpage = netfs_readpage,
> +	.readahead = netfs_readahead,
>  	.set_page_dirty = v9fs_set_page_dirty,
>  	.writepage = v9fs_vfs_writepage,
>  	.write_begin = v9fs_write_begin,
> diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
> index 2a10242c79c7..a7dc6781a622 100644
> --- a/fs/9p/vfs_inode.c
> +++ b/fs/9p/vfs_inode.c
> @@ -231,9 +231,6 @@ struct inode *v9fs_alloc_inode(struct super_block *sb)
>  	v9inode = kmem_cache_alloc(v9fs_inode_cache, GFP_KERNEL);
>  	if (!v9inode)
>  		return NULL;
> -#ifdef CONFIG_9P_FSCACHE
> -	v9inode->fscache = NULL;
> -#endif
>  	v9inode->writeback_fid = NULL;
>  	v9inode->cache_validity = 0;
>  	mutex_init(&v9inode->v_mutex);
> @@ -250,6 +247,14 @@ void v9fs_free_inode(struct inode *inode)
>  	kmem_cache_free(v9fs_inode_cache, V9FS_I(inode));
>  }
>  
> +/*
> + * Set parameters for the netfs library
> + */
> +static void v9fs_set_netfs_context(struct inode *inode)
> +{
> +	netfs_i_context_init(inode, &v9fs_req_ops);
> +}
> +
>  int v9fs_init_inode(struct v9fs_session_info *v9ses,
>  		    struct inode *inode, umode_t mode, dev_t rdev)
>  {
> @@ -338,6 +343,8 @@ int v9fs_init_inode(struct v9fs_session_info *v9ses,
>  		err = -EINVAL;
>  		goto error;
>  	}
> +
> +	v9fs_set_netfs_context(inode);
>  error:
>  	return err;
>  
> diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
> index db832cc931c8..f120bcb8bf73 100644
> --- a/fs/afs/dynroot.c
> +++ b/fs/afs/dynroot.c
> @@ -76,6 +76,7 @@ struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
>  	/* there shouldn't be an existing inode */
>  	BUG_ON(!(inode->i_state & I_NEW));
>  
> +	netfs_i_context_init(inode, NULL);
>  	inode->i_size		= 0;
>  	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
>  	if (root) {
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index 6469d7f98ef5..2b68b2070248 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -19,13 +19,11 @@
>  #include "internal.h"
>  
>  static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
> -static int afs_readpage(struct file *file, struct page *page);
>  static int afs_symlink_readpage(struct file *file, struct page *page);
>  static void afs_invalidatepage(struct page *page, unsigned int offset,
>  			       unsigned int length);
>  static int afs_releasepage(struct page *page, gfp_t gfp_flags);
>  
> -static void afs_readahead(struct readahead_control *ractl);
>  static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
>  static void afs_vm_open(struct vm_area_struct *area);
>  static void afs_vm_close(struct vm_area_struct *area);
> @@ -52,8 +50,8 @@ const struct inode_operations afs_file_inode_operations = {
>  };
>  
>  const struct address_space_operations afs_file_aops = {
> -	.readpage	= afs_readpage,
> -	.readahead	= afs_readahead,
> +	.readpage	= netfs_readpage,
> +	.readahead	= netfs_readahead,
>  	.set_page_dirty	= afs_set_page_dirty,
>  	.launder_page	= afs_launder_page,
>  	.releasepage	= afs_releasepage,
> @@ -365,13 +363,6 @@ static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
>  	return 0;
>  }
>  
> -static bool afs_is_cache_enabled(struct inode *inode)
> -{
> -	struct fscache_cookie *cookie = afs_vnode_cache(AFS_FS_I(inode));
> -
> -	return fscache_cookie_enabled(cookie) && cookie->cache_priv;
> -}
> -
>  static int afs_begin_cache_operation(struct netfs_io_request *rreq)
>  {
>  #ifdef CONFIG_AFS_FSCACHE
> @@ -399,25 +390,12 @@ static void afs_priv_cleanup(struct address_space *mapping, void *netfs_priv)
>  
>  const struct netfs_request_ops afs_req_ops = {
>  	.init_request		= afs_init_request,
> -	.is_cache_enabled	= afs_is_cache_enabled,
>  	.begin_cache_operation	= afs_begin_cache_operation,
>  	.check_write_begin	= afs_check_write_begin,
>  	.issue_read		= afs_issue_read,
>  	.cleanup		= afs_priv_cleanup,
>  };
>  
> -static int afs_readpage(struct file *file, struct page *page)
> -{
> -	struct folio *folio = page_folio(page);
> -
> -	return netfs_readpage(file, folio, &afs_req_ops, NULL);
> -}
> -
> -static void afs_readahead(struct readahead_control *ractl)
> -{
> -	netfs_readahead(ractl, &afs_req_ops, NULL);
> -}
> -
>  int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  {
>  	fscache_unpin_writeback(wbc, afs_vnode_cache(AFS_FS_I(inode)));
> diff --git a/fs/afs/inode.c b/fs/afs/inode.c
> index 5964f8aee090..5b5e40197655 100644
> --- a/fs/afs/inode.c
> +++ b/fs/afs/inode.c
> @@ -53,6 +53,14 @@ static noinline void dump_vnode(struct afs_vnode *vnode, struct afs_vnode *paren
>  		dump_stack();
>  }
>  
> +/*
> + * Set parameters for the netfs library
> + */
> +static void afs_set_netfs_context(struct afs_vnode *vnode)
> +{
> +	netfs_i_context_init(&vnode->vfs_inode, &afs_req_ops);
> +}
> +
>  /*
>   * Initialise an inode from the vnode status.
>   */
> @@ -128,6 +136,7 @@ static int afs_inode_init_from_status(struct afs_operation *op,
>  	}
>  
>  	afs_set_i_size(vnode, status->size);
> +	afs_set_netfs_context(vnode);
>  
>  	vnode->invalid_before	= status->data_version;
>  	inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
> @@ -420,7 +429,7 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
>  	struct afs_vnode_cache_aux aux;
>  
>  	if (vnode->status.type != AFS_FTYPE_FILE) {
> -		vnode->cache = NULL;
> +		vnode->netfs_ctx.cache = NULL;
>  		return;
>  	}
>  
> @@ -430,12 +439,14 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
>  	key.vnode_id_ext[1]	= htonl(vnode->fid.vnode_hi);
>  	afs_set_cache_aux(vnode, &aux);
>  
> -	vnode->cache = fscache_acquire_cookie(
> -		vnode->volume->cache,
> -		vnode->status.type == AFS_FTYPE_FILE ? 0 : FSCACHE_ADV_SINGLE_CHUNK,
> -		&key, sizeof(key),
> -		&aux, sizeof(aux),
> -		vnode->status.size);
> +	afs_vnode_set_cache(vnode,
> +			    fscache_acquire_cookie(
> +				    vnode->volume->cache,
> +				    vnode->status.type == AFS_FTYPE_FILE ?
> +				    0 : FSCACHE_ADV_SINGLE_CHUNK,
> +				    &key, sizeof(key),
> +				    &aux, sizeof(aux),
> +				    vnode->status.size));
>  #endif
>  }
>  
> @@ -528,6 +539,7 @@ struct inode *afs_root_iget(struct super_block *sb, struct key *key)
>  
>  	vnode = AFS_FS_I(inode);
>  	vnode->cb_v_break = as->volume->cb_v_break,
> +	afs_set_netfs_context(vnode);
>  
>  	op = afs_alloc_operation(key, as->volume);
>  	if (IS_ERR(op)) {
> @@ -786,11 +798,8 @@ void afs_evict_inode(struct inode *inode)
>  		afs_put_wb_key(wbk);
>  	}
>  
> -#ifdef CONFIG_AFS_FSCACHE
> -	fscache_relinquish_cookie(vnode->cache,
> +	fscache_relinquish_cookie(afs_vnode_cache(vnode),
>  				  test_bit(AFS_VNODE_DELETED, &vnode->flags));
> -	vnode->cache = NULL;
> -#endif
>  
>  	afs_prune_wb_keys(vnode);
>  	afs_put_permits(rcu_access_pointer(vnode->permit_cache));
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index c56a0e1719ae..75ca3026457e 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -619,15 +619,16 @@ enum afs_lock_state {
>   * leak from one inode to another.
>   */
>  struct afs_vnode {
> -	struct inode		vfs_inode;	/* the VFS's inode record */
> +	struct {
> +		/* These must be contiguous */
> +		struct inode	vfs_inode;	/* the VFS's inode record */
> +		struct netfs_i_context netfs_ctx; /* Netfslib context */
> +	};
>  
>  	struct afs_volume	*volume;	/* volume on which vnode resides */
>  	struct afs_fid		fid;		/* the file identifier for this inode */
>  	struct afs_file_status	status;		/* AFS status info for this file */
>  	afs_dataversion_t	invalid_before;	/* Child dentries are invalid before this */
> -#ifdef CONFIG_AFS_FSCACHE
> -	struct fscache_cookie	*cache;		/* caching cookie */
> -#endif
>  	struct afs_permits __rcu *permit_cache;	/* cache of permits so far obtained */
>  	struct mutex		io_lock;	/* Lock for serialising I/O on this mutex */
>  	struct rw_semaphore	validate_lock;	/* lock for validating this vnode */
> @@ -674,12 +675,20 @@ struct afs_vnode {
>  static inline struct fscache_cookie *afs_vnode_cache(struct afs_vnode *vnode)
>  {
>  #ifdef CONFIG_AFS_FSCACHE
> -	return vnode->cache;
> +	return netfs_i_cookie(&vnode->vfs_inode);
>  #else
>  	return NULL;
>  #endif
>  }
>  
> +static inline void afs_vnode_set_cache(struct afs_vnode *vnode,
> +				       struct fscache_cookie *cookie)
> +{
> +#ifdef CONFIG_AFS_FSCACHE
> +	vnode->netfs_ctx.cache = cookie;
> +#endif
> +}
> +
>  /*
>   * cached security record for one user's attempt to access a vnode
>   */
> diff --git a/fs/afs/super.c b/fs/afs/super.c
> index 5ec9fd97eccc..e66c6f54ac8e 100644
> --- a/fs/afs/super.c
> +++ b/fs/afs/super.c
> @@ -688,13 +688,11 @@ static struct inode *afs_alloc_inode(struct super_block *sb)
>  	/* Reset anything that shouldn't leak from one inode to the next. */
>  	memset(&vnode->fid, 0, sizeof(vnode->fid));
>  	memset(&vnode->status, 0, sizeof(vnode->status));
> +	afs_vnode_set_cache(vnode, NULL);
>  
>  	vnode->volume		= NULL;
>  	vnode->lock_key		= NULL;
>  	vnode->permit_cache	= NULL;
> -#ifdef CONFIG_AFS_FSCACHE
> -	vnode->cache		= NULL;
> -#endif
>  
>  	vnode->flags		= 1 << AFS_VNODE_UNSET;
>  	vnode->lock_state	= AFS_VNODE_LOCK_NONE;
> diff --git a/fs/afs/write.c b/fs/afs/write.c
> index 5e9157d0da29..e4b47f67a408 100644
> --- a/fs/afs/write.c
> +++ b/fs/afs/write.c
> @@ -59,8 +59,7 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
>  	 * file.  We need to do this before we get a lock on the page in case
>  	 * there's more than one writer competing for the same cache block.
>  	 */
> -	ret = netfs_write_begin(file, mapping, pos, len, flags, &folio, fsdata,
> -				&afs_req_ops, NULL);
> +	ret = netfs_write_begin(file, mapping, pos, len, flags, &folio, fsdata);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 9189257476f8..a758c106c533 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -354,6 +354,42 @@ static void ceph_netfs_issue_read(struct netfs_io_subrequest *subreq)
>  	dout("%s: result %d\n", __func__, err);
>  }
>  
> +static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
> +{
> +	struct inode *inode = rreq->inode;
> +	int got = 0, want = CEPH_CAP_FILE_CACHE;
> +	int ret = 0;
> +
> +	if (file) {
> +		struct ceph_rw_context *rw_ctx;
> +		struct ceph_file_info *fi = file->private_data;
> +
> +		rw_ctx = ceph_find_rw_context(fi);
> +		if (rw_ctx)
> +			return 0;
> +	}
> +
> +	if (rreq->origin != NETFS_READAHEAD)
> +		return 0;
> +
> +	/*
> +	 * readahead callers do not necessarily hold Fcb caps
> +	 * (e.g. fadvise, madvise).
> +	 */
> +	ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
> +	if (ret < 0) {
> +		dout("start_read %p, error getting cap\n", inode);
> +		return ret;
> +	}
> +
> +	if (!(got & want)) {
> +		dout("start_read %p, no cache cap\n", inode);
> +		return -EACCES;
> +	}
> +
> +	return ret == 1 ? 0 : -EACCES;
> +}
> +

^^^
The above change seems like it should be in its own patch. Wasn't it at
one point? Converting this to use init_request doesn't seem to rely on
the new embedded context.

>  static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  {
>  	struct inode *inode = mapping->host;
> @@ -364,8 +400,8 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  		ceph_put_cap_refs(ci, got);
>  }
>  
> -static const struct netfs_request_ops ceph_netfs_read_ops = {
> -	.is_cache_enabled	= ceph_is_cache_enabled,
> +const struct netfs_request_ops ceph_netfs_ops = {
> +	.init_request		= ceph_init_request,
>  	.begin_cache_operation	= ceph_begin_cache_operation,
>  	.issue_read		= ceph_netfs_issue_read,
>  	.expand_readahead	= ceph_netfs_expand_readahead,
> @@ -374,54 +410,6 @@ static const struct netfs_request_ops ceph_netfs_read_ops = {
>  	.cleanup		= ceph_readahead_cleanup,
>  };
>  
> -/* read a single page, without unlocking it. */
> -static int ceph_readpage(struct file *file, struct page *subpage)
> -{
> -	struct folio *folio = page_folio(subpage);
> -	struct inode *inode = file_inode(file);
> -	struct ceph_inode_info *ci = ceph_inode(inode);
> -	struct ceph_vino vino = ceph_vino(inode);
> -	size_t len = folio_size(folio);
> -	u64 off = folio_file_pos(folio);
> -
> -	dout("readpage ino %llx.%llx file %p off %llu len %zu folio %p index %lu\n inline %d",
> -	     vino.ino, vino.snap, file, off, len, folio, folio_index(folio),
> -	     ci->i_inline_version != CEPH_INLINE_NONE);
> -
> -	return netfs_readpage(file, folio, &ceph_netfs_read_ops, NULL);
> -}
> -
> -static void ceph_readahead(struct readahead_control *ractl)
> -{
> -	struct inode *inode = file_inode(ractl->file);
> -	struct ceph_file_info *fi = ractl->file->private_data;
> -	struct ceph_rw_context *rw_ctx;
> -	int got = 0;
> -	int ret = 0;
> -
> -	if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
> -		return;
> -
> -	rw_ctx = ceph_find_rw_context(fi);
> -	if (!rw_ctx) {
> -		/*
> -		 * readahead callers do not necessarily hold Fcb caps
> -		 * (e.g. fadvise, madvise).
> -		 */
> -		int want = CEPH_CAP_FILE_CACHE;
> -
> -		ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
> -		if (ret < 0)
> -			dout("start_read %p, error getting cap\n", inode);
> -		else if (!(got & want))
> -			dout("start_read %p, no cache cap\n", inode);
> -
> -		if (ret <= 0)
> -			return;
> -	}
> -	netfs_readahead(ractl, &ceph_netfs_read_ops, (void *)(uintptr_t)got);
> -}
> -
>  #ifdef CONFIG_CEPH_FSCACHE
>  static void ceph_set_page_fscache(struct page *page)
>  {
> @@ -1320,8 +1308,7 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
>  	struct folio *folio = NULL;
>  	int r;
>  
> -	r = netfs_write_begin(file, inode->i_mapping, pos, len, 0, &folio, NULL,
> -			      &ceph_netfs_read_ops, NULL);
> +	r = netfs_write_begin(file, inode->i_mapping, pos, len, 0, &folio, NULL);
>  	if (r == 0)
>  		folio_wait_fscache(folio);
>  	if (r < 0) {
> @@ -1375,8 +1362,8 @@ static int ceph_write_end(struct file *file, struct address_space *mapping,
>  }
>  
>  const struct address_space_operations ceph_aops = {
> -	.readpage = ceph_readpage,
> -	.readahead = ceph_readahead,
> +	.readpage = netfs_readpage,
> +	.readahead = netfs_readahead,
>  	.writepage = ceph_writepage,
>  	.writepages = ceph_writepages_start,
>  	.write_begin = ceph_write_begin,
> diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
> index 7d22850623ef..ddea99922073 100644
> --- a/fs/ceph/cache.c
> +++ b/fs/ceph/cache.c
> @@ -29,26 +29,25 @@ void ceph_fscache_register_inode_cookie(struct inode *inode)
>  	if (!(inode->i_state & I_NEW))
>  		return;
>  
> -	WARN_ON_ONCE(ci->fscache);
> +	WARN_ON_ONCE(ci->netfs_ctx.cache);
>  
> -	ci->fscache = fscache_acquire_cookie(fsc->fscache, 0,
> -					     &ci->i_vino, sizeof(ci->i_vino),
> -					     &ci->i_version, sizeof(ci->i_version),
> -					     i_size_read(inode));
> +	ci->netfs_ctx.cache =
> +		fscache_acquire_cookie(fsc->fscache, 0,
> +				       &ci->i_vino, sizeof(ci->i_vino),
> +				       &ci->i_version, sizeof(ci->i_version),
> +				       i_size_read(inode));
>  }
>  
> -void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info* ci)
> +void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info *ci)
>  {
> -	struct fscache_cookie *cookie = ci->fscache;
> -
> -	fscache_relinquish_cookie(cookie, false);
> +	fscache_relinquish_cookie(ceph_fscache_cookie(ci), false);
>  }
>  
>  void ceph_fscache_use_cookie(struct inode *inode, bool will_modify)
>  {
>  	struct ceph_inode_info *ci = ceph_inode(inode);
>  
> -	fscache_use_cookie(ci->fscache, will_modify);
> +	fscache_use_cookie(ceph_fscache_cookie(ci), will_modify);
>  }
>  
>  void ceph_fscache_unuse_cookie(struct inode *inode, bool update)
> @@ -58,9 +57,10 @@ void ceph_fscache_unuse_cookie(struct inode *inode, bool update)
>  	if (update) {
>  		loff_t i_size = i_size_read(inode);
>  
> -		fscache_unuse_cookie(ci->fscache, &ci->i_version, &i_size);
> +		fscache_unuse_cookie(ceph_fscache_cookie(ci),
> +				     &ci->i_version, &i_size);
>  	} else {
> -		fscache_unuse_cookie(ci->fscache, NULL, NULL);
> +		fscache_unuse_cookie(ceph_fscache_cookie(ci), NULL, NULL);
>  	}
>  }
>  
> @@ -69,14 +69,14 @@ void ceph_fscache_update(struct inode *inode)
>  	struct ceph_inode_info *ci = ceph_inode(inode);
>  	loff_t i_size = i_size_read(inode);
>  
> -	fscache_update_cookie(ci->fscache, &ci->i_version, &i_size);
> +	fscache_update_cookie(ceph_fscache_cookie(ci), &ci->i_version, &i_size);
>  }
>  
>  void ceph_fscache_invalidate(struct inode *inode, bool dio_write)
>  {
>  	struct ceph_inode_info *ci = ceph_inode(inode);
>  
> -	fscache_invalidate(ceph_inode(inode)->fscache,
> +	fscache_invalidate(ceph_fscache_cookie(ci),
>  			   &ci->i_version, i_size_read(inode),
>  			   dio_write ? FSCACHE_INVAL_DIO_WRITE : 0);
>  }
> diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
> index b8b3b5cb6438..c20e43cade94 100644
> --- a/fs/ceph/cache.h
> +++ b/fs/ceph/cache.h
> @@ -26,14 +26,9 @@ void ceph_fscache_unuse_cookie(struct inode *inode, bool update);
>  void ceph_fscache_update(struct inode *inode);
>  void ceph_fscache_invalidate(struct inode *inode, bool dio_write);
>  
> -static inline void ceph_fscache_inode_init(struct ceph_inode_info *ci)
> -{
> -	ci->fscache = NULL;
> -}
> -
>  static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode_info *ci)
>  {
> -	return ci->fscache;
> +	return netfs_i_cookie(&ci->vfs_inode);
>  }
>  
>  static inline void ceph_fscache_resize(struct inode *inode, loff_t to)
> @@ -91,10 +86,6 @@ static inline void ceph_fscache_unregister_fs(struct ceph_fs_client* fsc)
>  {
>  }
>  
> -static inline void ceph_fscache_inode_init(struct ceph_inode_info *ci)
> -{
> -}
> -
>  static inline void ceph_fscache_register_inode_cookie(struct inode *inode)
>  {
>  }
> diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> index 7b1e93c8a0d2..6a176d9d394a 100644
> --- a/fs/ceph/inode.c
> +++ b/fs/ceph/inode.c
> @@ -453,6 +453,9 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
>  
>  	dout("alloc_inode %p\n", &ci->vfs_inode);
>  
> +	/* Set parameters for the netfs library */
> +	netfs_i_context_init(&ci->vfs_inode, &ceph_netfs_ops);
> +
>  	spin_lock_init(&ci->i_ceph_lock);
>  
>  	ci->i_version = 0;
> @@ -538,9 +541,6 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
>  	INIT_WORK(&ci->i_work, ceph_inode_work);
>  	ci->i_work_mask = 0;
>  	memset(&ci->i_btime, '\0', sizeof(ci->i_btime));
> -
> -	ceph_fscache_inode_init(ci);
> -
>  	return &ci->vfs_inode;
>  }
>  
> diff --git a/fs/ceph/super.h b/fs/ceph/super.h
> index 0b4b519682f1..f9f01ed6ffee 100644
> --- a/fs/ceph/super.h
> +++ b/fs/ceph/super.h
> @@ -17,13 +17,11 @@
>  #include <linux/posix_acl.h>
>  #include <linux/refcount.h>
>  #include <linux/security.h>
> +#include <linux/netfs.h>
> +#include <linux/fscache.h>
>  
>  #include <linux/ceph/libceph.h>
>  
> -#ifdef CONFIG_CEPH_FSCACHE
> -#include <linux/fscache.h>
> -#endif
> -
>  /* large granularity for statfs utilization stats to facilitate
>   * large volume sizes on 32-bit machines. */
>  #define CEPH_BLOCK_SHIFT   22  /* 4 MB */
> @@ -317,6 +315,10 @@ struct ceph_inode_xattrs_info {
>   * Ceph inode.
>   */
>  struct ceph_inode_info {
> +	struct {
> +		struct inode vfs_inode;
> +		struct netfs_i_context netfs_ctx; /* Netfslib context */
> +	};
>  	struct ceph_vino i_vino;   /* ceph ino + snap */
>  
>  	spinlock_t i_ceph_lock;
> @@ -427,11 +429,6 @@ struct ceph_inode_info {
>  
>  	struct work_struct i_work;
>  	unsigned long  i_work_mask;
> -
> -#ifdef CONFIG_CEPH_FSCACHE
> -	struct fscache_cookie *fscache;
> -#endif
> -	struct inode vfs_inode; /* at end */
>  };
>  
>  static inline struct ceph_inode_info *
> @@ -1215,6 +1212,7 @@ extern void __ceph_touch_fmode(struct ceph_inode_info *ci,
>  
>  /* addr.c */
>  extern const struct address_space_operations ceph_aops;
> +extern const struct netfs_request_ops ceph_netfs_ops;
>  extern int ceph_mmap(struct file *file, struct vm_area_struct *vma);
>  extern int ceph_uninline_data(struct file *file);
>  extern int ceph_pool_perm_check(struct inode *inode, int need);
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 48b343d03430..0a4085ced40f 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -16,6 +16,7 @@
>  #include <linux/mempool.h>
>  #include <linux/workqueue.h>
>  #include <linux/utsname.h>
> +#include <linux/netfs.h>
>  #include "cifs_fs_sb.h"
>  #include "cifsacl.h"
>  #include <crypto/internal/hash.h>
> @@ -1402,6 +1403,11 @@ void cifsFileInfo_put(struct cifsFileInfo *cifs_file);
>   */
>  
>  struct cifsInodeInfo {
> +	struct {
> +		/* These must be contiguous */
> +		struct inode	vfs_inode;	/* the VFS's inode record */
> +		struct netfs_i_context netfs_ctx; /* Netfslib context */
> +	};
>  	bool can_cache_brlcks;
>  	struct list_head llist;	/* locks helb by this inode */
>  	/*
> @@ -1432,10 +1438,6 @@ struct cifsInodeInfo {
>  	u64  uniqueid;			/* server inode number */
>  	u64  createtime;		/* creation time on server */
>  	__u8 lease_key[SMB2_LEASE_KEY_SIZE];	/* lease key for this inode */
> -#ifdef CONFIG_CIFS_FSCACHE
> -	struct fscache_cookie *fscache;
> -#endif
> -	struct inode vfs_inode;
>  	struct list_head deferred_closes; /* list of deferred closes */
>  	spinlock_t deferred_lock; /* protection on deferred list */
>  	bool lease_granted; /* Flag to indicate whether lease or oplock is granted. */
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index b47c2011ce5b..a638b29e9062 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -103,7 +103,7 @@ void cifs_fscache_get_inode_cookie(struct inode *inode)
>  
>  	cifs_fscache_fill_coherency(&cifsi->vfs_inode, &cd);
>  
> -	cifsi->fscache =
> +	cifsi->netfs_ctx.cache =
>  		fscache_acquire_cookie(tcon->fscache, 0,
>  				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
>  				       &cd, sizeof(cd),
> @@ -126,11 +126,12 @@ void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool update)
>  void cifs_fscache_release_inode_cookie(struct inode *inode)
>  {
>  	struct cifsInodeInfo *cifsi = CIFS_I(inode);
> +	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
>  
> -	if (cifsi->fscache) {
> -		cifs_dbg(FYI, "%s: (0x%p)\n", __func__, cifsi->fscache);
> -		fscache_relinquish_cookie(cifsi->fscache, false);
> -		cifsi->fscache = NULL;
> +	if (cookie) {
> +		cifs_dbg(FYI, "%s: (0x%p)\n", __func__, cookie);
> +		fscache_relinquish_cookie(cookie, false);
> +		cifsi->netfs_ctx.cache = NULL;
>  	}
>  }
>  
> diff --git a/fs/cifs/fscache.h b/fs/cifs/fscache.h
> index 55129908e2c1..52355c0912ae 100644
> --- a/fs/cifs/fscache.h
> +++ b/fs/cifs/fscache.h
> @@ -61,7 +61,7 @@ void cifs_fscache_fill_coherency(struct inode *inode,
>  
>  static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode)
>  {
> -	return CIFS_I(inode)->fscache;
> +	return netfs_i_cookie(inode);
>  }
>  
>  static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags)
> diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
> index 89837e904fa7..5f9719409f21 100644
> --- a/fs/netfs/internal.h
> +++ b/fs/netfs/internal.h
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/netfs.h>
> +#include <linux/fscache.h>
>  #include <trace/events/netfs.h>
>  
>  #ifdef pr_fmt
> @@ -19,8 +20,6 @@
>   */
>  struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>  					     struct file *file,
> -					     const struct netfs_request_ops *ops,
> -					     void *netfs_priv,
>  					     loff_t start, size_t len,
>  					     enum netfs_io_origin origin);
>  void netfs_get_request(struct netfs_io_request *rreq, enum netfs_rreq_ref_trace what);
> @@ -81,6 +80,20 @@ static inline void netfs_stat_d(atomic_t *stat)
>  #define netfs_stat_d(x) do {} while(0)
>  #endif
>  
> +/*
> + * Miscellaneous functions.
> + */
> +static inline bool netfs_is_cache_enabled(struct netfs_i_context *ctx)
> +{
> +#if IS_ENABLED(CONFIG_FSCACHE)
> +	struct fscache_cookie *cookie = ctx->cache;
> +
> +	return fscache_cookie_valid(cookie) && fscache_cookie_enabled(cookie);
> +#else
> +	return false;
> +#endif
> +}
> +
>  /*****************************************************************************/
>  /*
>   * debug tracing
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index ae18827e156b..657b19e60118 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -13,12 +13,12 @@
>   */
>  struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>  					     struct file *file,
> -					     const struct netfs_request_ops *ops,
> -					     void *netfs_priv,
>  					     loff_t start, size_t len,
>  					     enum netfs_io_origin origin)
>  {
>  	static atomic_t debug_ids;
> +	struct inode *inode = file ? file_inode(file) : mapping->host;
> +	struct netfs_i_context *ctx = netfs_i_context(inode);
>  	struct netfs_io_request *rreq;
>  	int ret;
>  
> @@ -29,11 +29,10 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>  	rreq->start	= start;
>  	rreq->len	= len;
>  	rreq->origin	= origin;
> -	rreq->netfs_ops	= ops;
> -	rreq->netfs_priv = netfs_priv;
> +	rreq->netfs_ops	= ctx->ops;
>  	rreq->mapping	= mapping;
> -	rreq->inode	= file_inode(file);
> -	rreq->i_size	= i_size_read(rreq->inode);
> +	rreq->inode	= inode;
> +	rreq->i_size	= i_size_read(inode);
>  	rreq->debug_id	= atomic_inc_return(&debug_ids);
>  	INIT_LIST_HEAD(&rreq->subrequests);
>  	INIT_WORK(&rreq->work, netfs_rreq_work);
> @@ -76,6 +75,7 @@ static void netfs_free_request(struct work_struct *work)
>  {
>  	struct netfs_io_request *rreq =
>  		container_of(work, struct netfs_io_request, work);
> +
>  	netfs_clear_subrequests(rreq, false);
>  	if (rreq->netfs_priv)
>  		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index b5176f4320f4..73be06c409bb 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -14,7 +14,6 @@
>  #include <linux/uio.h>
>  #include <linux/sched/mm.h>
>  #include <linux/task_io_accounting_ops.h>
> -#include <linux/netfs.h>
>  #include "internal.h"
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/netfs.h>
> @@ -735,8 +734,6 @@ static void netfs_rreq_expand(struct netfs_io_request *rreq,
>  /**
>   * netfs_readahead - Helper to manage a read request
>   * @ractl: The description of the readahead request
> - * @ops: The network filesystem's operations for the helper to use
> - * @netfs_priv: Private netfs data to be retained in the request
>   *
>   * Fulfil a readahead request by drawing data from the cache if possible, or
>   * the netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O
> @@ -744,35 +741,32 @@ static void netfs_rreq_expand(struct netfs_io_request *rreq,
>   * readahead window can be expanded in either direction to a more convenient
>   * alighment for RPC efficiency or to make storage in the cache feasible.
>   *
> - * The calling netfs must provide a table of operations, only one of which,
> - * issue_op, is mandatory.  It may also be passed a private token, which will
> - * be retained in rreq->netfs_priv and will be cleaned up by ops->cleanup().
> + * The calling netfs must initialise a netfs context contiguous to the vfs
> + * inode before calling this.
>   *
>   * This is usable whether or not caching is enabled.
>   */
> -void netfs_readahead(struct readahead_control *ractl,
> -		     const struct netfs_request_ops *ops,
> -		     void *netfs_priv)
> +void netfs_readahead(struct readahead_control *ractl)
>  {
>  	struct netfs_io_request *rreq;
> +	struct netfs_i_context *ctx = netfs_i_context(ractl->mapping->host);
>  	unsigned int debug_index = 0;
>  	int ret;
>  
>  	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
>  
>  	if (readahead_count(ractl) == 0)
> -		goto cleanup;
> +		return;
>  
>  	rreq = netfs_alloc_request(ractl->mapping, ractl->file,
> -				   ops, netfs_priv,
>  				   readahead_pos(ractl),
>  				   readahead_length(ractl),
>  				   NETFS_READAHEAD);
>  	if (IS_ERR(rreq))
> -		goto cleanup;
> +		return;
>  
> -	if (ops->begin_cache_operation) {
> -		ret = ops->begin_cache_operation(rreq);
> +	if (ctx->ops->begin_cache_operation) {
> +		ret = ctx->ops->begin_cache_operation(rreq);
>  		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
>  			goto cleanup_free;
>  	}
> @@ -804,42 +798,35 @@ void netfs_readahead(struct readahead_control *ractl,
>  cleanup_free:
>  	netfs_put_request(rreq, false, netfs_rreq_trace_put_failed);
>  	return;
> -cleanup:
> -	if (netfs_priv)
> -		ops->cleanup(ractl->mapping, netfs_priv);
> -	return;
>  }
>  EXPORT_SYMBOL(netfs_readahead);
>  
>  /**
>   * netfs_readpage - Helper to manage a readpage request
>   * @file: The file to read from
> - * @folio: The folio to read
> - * @ops: The network filesystem's operations for the helper to use
> - * @netfs_priv: Private netfs data to be retained in the request
> + * @subpage: A subpage of the folio to read
>   *
>   * Fulfil a readpage request by drawing data from the cache if possible, or the
>   * netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O requests
>   * from different sources will get munged together.
>   *
> - * The calling netfs must provide a table of operations, only one of which,
> - * issue_op, is mandatory.  It may also be passed a private token, which will
> - * be retained in rreq->netfs_priv and will be cleaned up by ops->cleanup().
> + * The calling netfs must initialise a netfs context contiguous to the vfs
> + * inode before calling this.
>   *
>   * This is usable whether or not caching is enabled.
>   */
> -int netfs_readpage(struct file *file,
> -		   struct folio *folio,
> -		   const struct netfs_request_ops *ops,
> -		   void *netfs_priv)
> +int netfs_readpage(struct file *file, struct page *subpage)
>  {
> +	struct folio *folio = page_folio(subpage);
> +	struct address_space *mapping = folio->mapping;
>  	struct netfs_io_request *rreq;
> +	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
>  	unsigned int debug_index = 0;
>  	int ret;
>  
>  	_enter("%lx", folio_index(folio));
>  
> -	rreq = netfs_alloc_request(folio->mapping, file, ops, netfs_priv,
> +	rreq = netfs_alloc_request(mapping, file,
>  				   folio_file_pos(folio), folio_size(folio),
>  				   NETFS_READPAGE);
>  	if (IS_ERR(rreq)) {
> @@ -847,8 +834,8 @@ int netfs_readpage(struct file *file,
>  		goto alloc_error;
>  	}
>  
> -	if (ops->begin_cache_operation) {
> -		ret = ops->begin_cache_operation(rreq);
> +	if (ctx->ops->begin_cache_operation) {
> +		ret = ctx->ops->begin_cache_operation(rreq);
>  		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS) {
>  			folio_unlock(folio);
>  			goto out;
> @@ -886,8 +873,6 @@ int netfs_readpage(struct file *file,
>  	netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
>  	return ret;
>  alloc_error:
> -	if (netfs_priv)
> -		ops->cleanup(folio_file_mapping(folio), netfs_priv);
>  	folio_unlock(folio);
>  	return ret;
>  }
> @@ -898,6 +883,7 @@ EXPORT_SYMBOL(netfs_readpage);
>   * @folio: The folio being prepared
>   * @pos: starting position for the write
>   * @len: length of write
> + * @always_fill: T if the folio should always be completely filled/cleared
>   *
>   * In some cases, write_begin doesn't need to read at all:
>   * - full folio write
> @@ -907,17 +893,27 @@ EXPORT_SYMBOL(netfs_readpage);
>   * If any of these criteria are met, then zero out the unwritten parts
>   * of the folio and return true. Otherwise, return false.
>   */
> -static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len)
> +static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
> +				 bool always_fill)
>  {
>  	struct inode *inode = folio_inode(folio);
>  	loff_t i_size = i_size_read(inode);
>  	size_t offset = offset_in_folio(folio, pos);
> +	size_t plen = folio_size(folio);
> +
> +	if (unlikely(always_fill)) {
> +		if (pos - offset + len <= i_size)
> +			return false; /* Page entirely before EOF */
> +		zero_user_segment(&folio->page, 0, plen);
> +		folio_mark_uptodate(folio);
> +		return true;
> +	}
>  
>  	/* Full folio write */
> -	if (offset == 0 && len >= folio_size(folio))
> +	if (offset == 0 && len >= plen)
>  		return true;
>  
> -	/* pos beyond last folio in the file */
> +	/* Page entirely beyond the end of the file */
>  	if (pos - offset >= i_size)
>  		goto zero_out;
>  
> @@ -927,7 +923,7 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len)
>  
>  	return false;
>  zero_out:
> -	zero_user_segments(&folio->page, 0, offset, offset + len, folio_size(folio));
> +	zero_user_segments(&folio->page, 0, offset, offset + len, len);
>  	return true;
>  }
>  
> @@ -940,8 +936,6 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len)
>   * @aop_flags: AOP_* flags
>   * @_folio: Where to put the resultant folio
>   * @_fsdata: Place for the netfs to store a cookie
> - * @ops: The network filesystem's operations for the helper to use
> - * @netfs_priv: Private netfs data to be retained in the request
>   *
>   * Pre-read data for a write-begin request by drawing data from the cache if
>   * possible, or the netfs if not.  Space beyond the EOF is zero-filled.
> @@ -960,17 +954,18 @@ static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len)
>   * should go ahead; unlock the folio and return -EAGAIN to cause the folio to
>   * be regot; or return an error.
>   *
> + * The calling netfs must initialise a netfs context contiguous to the vfs
> + * inode before calling this.
> + *
>   * This is usable whether or not caching is enabled.
>   */
>  int netfs_write_begin(struct file *file, struct address_space *mapping,
>  		      loff_t pos, unsigned int len, unsigned int aop_flags,
> -		      struct folio **_folio, void **_fsdata,
> -		      const struct netfs_request_ops *ops,
> -		      void *netfs_priv)
> +		      struct folio **_folio, void **_fsdata)
>  {
>  	struct netfs_io_request *rreq;
> +	struct netfs_i_context *ctx = netfs_i_context(file_inode(file ));
>  	struct folio *folio;
> -	struct inode *inode = file_inode(file);
>  	unsigned int debug_index = 0, fgp_flags;
>  	pgoff_t index = pos >> PAGE_SHIFT;
>  	int ret;
> @@ -986,9 +981,9 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	if (!folio)
>  		return -ENOMEM;
>  
> -	if (ops->check_write_begin) {
> +	if (ctx->ops->check_write_begin) {
>  		/* Allow the netfs (eg. ceph) to flush conflicts. */
> -		ret = ops->check_write_begin(file, pos, len, folio, _fsdata);
> +		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
>  		if (ret < 0) {
>  			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
>  			if (ret == -EAGAIN)
> @@ -1004,13 +999,13 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	 * within the cache granule containing the EOF, in which case we need
>  	 * to preload the granule.
>  	 */
> -	if (!ops->is_cache_enabled(inode) &&
> -	    netfs_skip_folio_read(folio, pos, len)) {
> +	if (!netfs_is_cache_enabled(ctx) &&
> +	    netfs_skip_folio_read(folio, pos, len, false)) {
>  		netfs_stat(&netfs_n_rh_write_zskip);
>  		goto have_folio_no_wait;
>  	}
>  
> -	rreq = netfs_alloc_request(mapping, file, ops, netfs_priv,
> +	rreq = netfs_alloc_request(mapping, file,
>  				   folio_file_pos(folio), folio_size(folio),
>  				   NETFS_READ_FOR_WRITE);
>  	if (IS_ERR(rreq)) {
> @@ -1019,10 +1014,9 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	}
>  	rreq->no_unlock_folio	= folio_index(folio);
>  	__set_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags);
> -	netfs_priv = NULL;
>  
> -	if (ops->begin_cache_operation) {
> -		ret = ops->begin_cache_operation(rreq);
> +	if (ctx->ops->begin_cache_operation) {
> +		ret = ctx->ops->begin_cache_operation(rreq);
>  		if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
>  			goto error_put;
>  	}
> @@ -1076,8 +1070,6 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	if (ret < 0)
>  		goto error;
>  have_folio_no_wait:
> -	if (netfs_priv)
> -		ops->cleanup(mapping, netfs_priv);
>  	*_folio = folio;
>  	_leave(" = 0");
>  	return 0;
> @@ -1087,8 +1079,6 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  error:
>  	folio_unlock(folio);
>  	folio_put(folio);
> -	if (netfs_priv)
> -		ops->cleanup(mapping, netfs_priv);
>  	_leave(" = %d", ret);
>  	return ret;
>  }
> diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
> index 9ae538c85378..5510a7a14a40 100644
> --- a/fs/netfs/stats.c
> +++ b/fs/netfs/stats.c
> @@ -7,7 +7,6 @@
>  
>  #include <linux/export.h>
>  #include <linux/seq_file.h>
> -#include <linux/netfs.h>
>  #include "internal.h"
>  
>  atomic_t netfs_n_rh_readahead;
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 4b99e38f73d9..8458b30172a5 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -118,6 +118,16 @@ enum netfs_io_source {
>  typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
>  				      bool was_async);
>  
> +/*
> + * Per-inode description.  This must be directly after the inode struct.
> + */
> +struct netfs_i_context {
> +	const struct netfs_request_ops *ops;
> +#if IS_ENABLED(CONFIG_FSCACHE)
> +	struct fscache_cookie	*cache;
> +#endif
> +};
> +
>  /*
>   * Resources required to do operations on a cache.
>   */
> @@ -192,7 +202,6 @@ struct netfs_io_request {
>   * Operations the network filesystem can/must provide to the helpers.
>   */
>  struct netfs_request_ops {
> -	bool (*is_cache_enabled)(struct inode *inode);
>  	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
>  	int (*begin_cache_operation)(struct netfs_io_request *rreq);
>  	void (*expand_readahead)(struct netfs_io_request *rreq);
> @@ -263,18 +272,11 @@ struct netfs_cache_ops {
>  };
>  
>  struct readahead_control;
> -extern void netfs_readahead(struct readahead_control *,
> -			    const struct netfs_request_ops *,
> -			    void *);
> -extern int netfs_readpage(struct file *,
> -			  struct folio *,
> -			  const struct netfs_request_ops *,
> -			  void *);
> +extern void netfs_readahead(struct readahead_control *);
> +extern int netfs_readpage(struct file *, struct page *);
>  extern int netfs_write_begin(struct file *, struct address_space *,
>  			     loff_t, unsigned int, unsigned int, struct folio **,
> -			     void **,
> -			     const struct netfs_request_ops *,
> -			     void *);
> +			     void **);
>  
>  extern void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
>  extern void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
> @@ -283,4 +285,61 @@ extern void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
>  				 bool was_async, enum netfs_sreq_ref_trace what);
>  extern void netfs_stats_show(struct seq_file *);
>  
> +/**
> + * netfs_i_context - Get the netfs inode context from the inode
> + * @inode: The inode to query
> + *
> + * Get the netfs lib inode context from the network filesystem's inode.  The
> + * context struct is expected to directly follow on from the VFS inode struct.
> + */
> +static inline struct netfs_i_context *netfs_i_context(struct inode *inode)
> +{
> +	return (struct netfs_i_context *)(inode + 1);
> +}
> +
> +/**
> + * netfs_inode - Get the netfs inode from the inode context
> + * @ctx: The context to query
> + *
> + * Get the netfs inode from the netfs library's inode context.  The VFS inode
> + * is expected to directly precede the context struct.
> + */
> +static inline struct inode *netfs_inode(struct netfs_i_context *ctx)
> +{
> +	return ((struct inode *)ctx) - 1;
> +}
> +
> +/**
> + * netfs_i_context_init - Initialise a netfs lib context
> + * @inode: The inode with which the context is associated
> + * @ops: The netfs's operations list
> + *
> + * Initialise the netfs library context struct.  This is expected to follow on
> + * directly from the VFS inode struct.
> + */
> +static inline void netfs_i_context_init(struct inode *inode,
> +					const struct netfs_request_ops *ops)
> +{
> +	struct netfs_i_context *ctx = netfs_i_context(inode);
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->ops = ops;
> +}
> +
> +/**
> + * netfs_i_cookie - Get the cache cookie from the inode
> + * @inode: The inode to query
> + *
> + * Get the caching cookie (if enabled) from the network filesystem's inode.
> + */
> +static inline struct fscache_cookie *netfs_i_cookie(struct inode *inode)
> +{
> +#if IS_ENABLED(CONFIG_FSCACHE)
> +	struct netfs_i_context *ctx = netfs_i_context(inode);
> +	return ctx->cache;
> +#else
> +	return NULL;
> +#endif
> +}
> +
>  #endif /* _LINUX_NETFS_H */
> 
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

