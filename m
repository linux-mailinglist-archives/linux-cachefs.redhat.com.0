Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6405626E7BB
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Sep 2020 23:57:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-NYjAwdWwOPe9TwC3AMXgJQ-1; Thu, 17 Sep 2020 17:57:45 -0400
X-MC-Unique: NYjAwdWwOPe9TwC3AMXgJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 467F8425CE;
	Thu, 17 Sep 2020 21:57:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED87D10013C1;
	Thu, 17 Sep 2020 21:57:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9153144A7F;
	Thu, 17 Sep 2020 21:57:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HLvbTc024719 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 17:57:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9777C115D9B; Thu, 17 Sep 2020 21:57:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 922B4115D9A
	for <linux-cachefs@redhat.com>; Thu, 17 Sep 2020 21:57:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ED4588FA29
	for <linux-cachefs@redhat.com>; Thu, 17 Sep 2020 21:57:35 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-227-Q2RcRJCRMRORfd2zsjKhBw-1;
	Thu, 17 Sep 2020 17:57:31 -0400
X-MC-Unique: Q2RcRJCRMRORfd2zsjKhBw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 05A16571; Thu, 17 Sep 2020 17:57:29 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 05A16571
Date: Thu, 17 Sep 2020 17:57:29 -0400
From: bfields <bfields@fieldses.org>
To: Frank van der Linden <fllinden@amazon.com>
Message-ID: <20200917215729.GA18980@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
MIME-Version: 1.0
In-Reply-To: <20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 17, 2020 at 08:23:03PM +0000, Frank van der Linden wrote:
> On Thu, Sep 17, 2020 at 03:09:31PM -0400, bfields wrote:
> > 
> > On Thu, Sep 17, 2020 at 05:01:11PM +0100, Daire Byrne wrote:
> > >
> > > ----- On 15 Sep, 2020, at 18:21, bfields bfields@fieldses.org wrote:
> > >
> > > >> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per
> > > >> second) quickly eat up the CPU on the re-export server and perf top
> > > >> shows we are mostly in native_queued_spin_lock_slowpath.
> > > >
> > > > Any statistics on who's calling that function?
> > >
> > > I've always struggled to reproduce this with a simple open/close simulation, so I suspect some other operations need to be mixed in too. But I have one production workload that I know has lots of opens & closes (buggy software) included in amongst the usual reads, writes etc.
> > >
> > > With just 40 clients mounting the reexport server (v5.7.6) using NFSv4.2, we see the CPU of the nfsd threads increase rapidly and by the time we have 100 clients, we have maxed out the 32 cores of the server with most of that in native_queued_spin_lock_slowpath.
> > 
> > That sounds a lot like what Frank Van der Linden reported:
> > 
> >         https://lore.kernel.org/linux-nfs/20200608192122.GA19171@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com/
> > 
> > It looks like a bug in the filehandle caching code.
> > 
> > --b.
> 
> Yes, that does look like the same one.
> 
> I still think that not caching v4 files at all may be the best way to go
> here, since the intent of the filecache code was to speed up v2/v3 I/O,
> where you end up doing a lot of opens/closes, but it doesn't make as
> much sense for v4.
> 
> However, short of that, I tested a local patch a few months back, that
> I never posted here, so I'll do so now. It just makes v4 opens in to
> 'long term' opens, which do not get put on the LRU, since that doesn't
> make sense (they are in the hash table, so they are still cached).

That makes sense to me.  But I'm also not opposed to turning it off for
v4 at this point.

--b.

> Also, the file caching code seems to walk the LRU a little too often,
> but that's another issue - and this change keeps the LRU short, so it's
> not a big deal.
> 
> I don't particularly love this patch, but it does keep the LRU short, and
> did significantly speed up my testcase (by about 50%). So, maybe you can
> give it a try.
> 
> I'll also attach a second patch, that converts the hash table to an rhashtable,
> which automatically grows and shrinks in size with usage. That patch also
> helped, but not by nearly as much (I think it yielded another 10%).
> 
> - Frank

> >From 057a24e1b3744c716e4956eb34c2d15ed719db23 Mon Sep 17 00:00:00 2001
> From: Frank van der Linden <fllinden@amazon.com>
> Date: Fri, 26 Jun 2020 22:35:01 +0000
> Subject: [PATCH 1/2] nfsd: don't put nfsd_files with long term refs on the LRU
>  list
> 
> Files with long term references, as created by v4 OPENs, will
> just clutter the LRU list without a chance of being reaped.
> So, don't put them there at all.
> 
> When finding a file in the hash table for a long term ref, remove
> it from the LRU list.
> 
> When dropping the last long term ref, add it back to the LRU list.
> 
> Signed-off-by: Frank van der Linden <fllinden@amazon.com>
> ---
>  fs/nfsd/filecache.c | 81 ++++++++++++++++++++++++++++++++++++++++-----
>  fs/nfsd/filecache.h |  6 ++++
>  fs/nfsd/nfs4state.c |  2 +-
>  3 files changed, 79 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index 82198d747c4c..5ef6bb802f24 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -186,6 +186,7 @@ nfsd_file_alloc(struct inode *inode, unsigned int may, unsigned int hashval,
>  		nf->nf_inode = inode;
>  		nf->nf_hashval = hashval;
>  		refcount_set(&nf->nf_ref, 1);
> +		atomic_set(&nf->nf_lref, 0);
>  		nf->nf_may = may & NFSD_FILE_MAY_MASK;
>  		if (may & NFSD_MAY_NOT_BREAK_LEASE) {
>  			if (may & NFSD_MAY_WRITE)
> @@ -297,13 +298,26 @@ nfsd_file_put_noref(struct nfsd_file *nf)
>  	}
>  }
>  
> -void
> -nfsd_file_put(struct nfsd_file *nf)
> +static void
> +__nfsd_file_put(struct nfsd_file *nf, unsigned int flags)
>  {
>  	bool is_hashed;
> +	int refs;
> +
> +	refs = refcount_read(&nf->nf_ref);
> +
> +	if (flags & NFSD_ACQ_FILE_LONGTERM) {
> +		/*
> +		 * If we're dropping the last long term ref, and there
> +		 * are other references, put the file on the LRU list,
> +		 * as it now makes sense for it to be there.
> +		 */
> +		if (atomic_dec_return(&nf->nf_lref) == 0 && refs > 2)
> +			list_lru_add(&nfsd_file_lru, &nf->nf_lru);
> +	} else
> +		set_bit(NFSD_FILE_REFERENCED, &nf->nf_flags);
>  
> -	set_bit(NFSD_FILE_REFERENCED, &nf->nf_flags);
> -	if (refcount_read(&nf->nf_ref) > 2 || !nf->nf_file) {
> +	if (refs > 2 || !nf->nf_file) {
>  		nfsd_file_put_noref(nf);
>  		return;
>  	}
> @@ -317,6 +331,18 @@ nfsd_file_put(struct nfsd_file *nf)
>  		nfsd_file_gc();
>  }
>  
> +void
> +nfsd_file_put(struct nfsd_file *nf)
> +{
> +	__nfsd_file_put(nf, 0);
> +}
> +
> +void
> +nfsd_file_put_longterm(struct nfsd_file *nf)
> +{
> +	__nfsd_file_put(nf, NFSD_ACQ_FILE_LONGTERM);
> +}
> +
>  struct nfsd_file *
>  nfsd_file_get(struct nfsd_file *nf)
>  {
> @@ -934,13 +960,14 @@ nfsd_file_is_cached(struct inode *inode)
>  	return ret;
>  }
>  
> -__be32
> -nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
> -		  unsigned int may_flags, struct nfsd_file **pnf)
> +static __be32
> +__nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
> +		  unsigned int may_flags, struct nfsd_file **pnf,
> +		  unsigned int flags)
>  {
>  	__be32	status;
>  	struct net *net = SVC_NET(rqstp);
> -	struct nfsd_file *nf, *new;
> +	struct nfsd_file *nf, *new = NULL;
>  	struct inode *inode;
>  	unsigned int hashval;
>  	bool retry = true;
> @@ -1006,6 +1033,16 @@ nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  		}
>  	}
>  out:
> +	if (flags & NFSD_ACQ_FILE_LONGTERM) {
> +		/*
> +		 * A file with long term (v4) references will needlessly
> +		 * clutter the LRU, so remove it when adding the first
> +		 * long term ref.
> +		 */
> +		if (!new && atomic_inc_return(&nf->nf_lref) == 1)
> +			list_lru_del(&nfsd_file_lru, &nf->nf_lru);
> +	}
> +
>  	if (status == nfs_ok) {
>  		*pnf = nf;
>  	} else {
> @@ -1021,7 +1058,18 @@ nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  	refcount_inc(&nf->nf_ref);
>  	__set_bit(NFSD_FILE_HASHED, &nf->nf_flags);
>  	__set_bit(NFSD_FILE_PENDING, &nf->nf_flags);
> -	list_lru_add(&nfsd_file_lru, &nf->nf_lru);
> +
> +	/*
> +	 * Don't add a new file to the LRU if it's a long term reference.
> +	 * It is still added to the hash table, so it may be added to the
> +	 * LRU later, when the number of long term references drops back
> +	 * to zero, and there are other references.
> +	 */
> +	if (flags & NFSD_ACQ_FILE_LONGTERM)
> +		atomic_inc(&nf->nf_lref);
> +	else
> +		list_lru_add(&nfsd_file_lru, &nf->nf_lru);
> +
>  	hlist_add_head_rcu(&nf->nf_node, &nfsd_file_hashtbl[hashval].nfb_head);
>  	++nfsd_file_hashtbl[hashval].nfb_count;
>  	nfsd_file_hashtbl[hashval].nfb_maxcount = max(nfsd_file_hashtbl[hashval].nfb_maxcount,
> @@ -1054,6 +1102,21 @@ nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  	goto out;
>  }
>  
> +__be32
> +nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
> +		  unsigned int may_flags, struct nfsd_file **pnf)
> +{
> +	return __nfsd_file_acquire(rqstp, fhp, may_flags, pnf, 0);
> +}
> +
> +__be32
> +nfsd_file_acquire_longterm(struct svc_rqst *rqstp, struct svc_fh *fhp,
> +		  unsigned int may_flags, struct nfsd_file **pnf)
> +{
> +	return __nfsd_file_acquire(rqstp, fhp, may_flags, pnf,
> +				  NFSD_ACQ_FILE_LONGTERM);
> +}
> +
>  /*
>   * Note that fields may be added, removed or reordered in the future. Programs
>   * scraping this file for info should test the labels to ensure they're
> diff --git a/fs/nfsd/filecache.h b/fs/nfsd/filecache.h
> index 7872df5a0fe3..6e1db77d7148 100644
> --- a/fs/nfsd/filecache.h
> +++ b/fs/nfsd/filecache.h
> @@ -44,21 +44,27 @@ struct nfsd_file {
>  	struct inode		*nf_inode;
>  	unsigned int		nf_hashval;
>  	refcount_t		nf_ref;
> +	atomic_t		nf_lref;
>  	unsigned char		nf_may;
>  	struct nfsd_file_mark	*nf_mark;
>  	struct rw_semaphore	nf_rwsem;
>  };
>  
> +#define NFSD_ACQ_FILE_LONGTERM	0x0001
> +
>  int nfsd_file_cache_init(void);
>  void nfsd_file_cache_purge(struct net *);
>  void nfsd_file_cache_shutdown(void);
>  int nfsd_file_cache_start_net(struct net *net);
>  void nfsd_file_cache_shutdown_net(struct net *net);
>  void nfsd_file_put(struct nfsd_file *nf);
> +void nfsd_file_put_longterm(struct nfsd_file *nf);
>  struct nfsd_file *nfsd_file_get(struct nfsd_file *nf);
>  void nfsd_file_close_inode_sync(struct inode *inode);
>  bool nfsd_file_is_cached(struct inode *inode);
>  __be32 nfsd_file_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
>  		  unsigned int may_flags, struct nfsd_file **nfp);
> +__be32 nfsd_file_acquire_longterm(struct svc_rqst *rqstp, struct svc_fh *fhp,
> +		  unsigned int may_flags, struct nfsd_file **nfp);
>  int	nfsd_file_cache_stats_open(struct inode *, struct file *);
>  #endif /* _FS_NFSD_FILECACHE_H */
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index bb3d2c32664a..451a1071daf4 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -4838,7 +4838,7 @@ static __be32 nfs4_get_vfs_file(struct svc_rqst *rqstp, struct nfs4_file *fp,
>  
>  	if (!fp->fi_fds[oflag]) {
>  		spin_unlock(&fp->fi_lock);
> -		status = nfsd_file_acquire(rqstp, cur_fh, access, &nf);
> +		status = nfsd_file_acquire_longterm(rqstp, cur_fh, access, &nf);
>  		if (status)
>  			goto out_put_access;
>  		spin_lock(&fp->fi_lock);
> -- 
> 2.17.2
> 

> >From 79e7ffd01482d90cd5f6e98b5a362bbf95ea9b2c Mon Sep 17 00:00:00 2001
> From: Frank van der Linden <fllinden@amazon.com>
> Date: Thu, 16 Jul 2020 21:35:29 +0000
> Subject: [PATCH 2/2] nfsd: change file_hashtbl to an rhashtable
> 
> file_hashtbl can grow quite large, so use rhashtable, which has
> automatic growing (and shrinking).
> 
> Signed-off-by: Frank van der Linden <fllinden@amazon.com>
> ---
>  fs/nfsd/nfs4state.c | 112 +++++++++++++++++++++++++++++---------------
>  fs/nfsd/nfsctl.c    |   7 ++-
>  fs/nfsd/nfsd.h      |   4 ++
>  fs/nfsd/state.h     |   3 +-
>  4 files changed, 86 insertions(+), 40 deletions(-)
> 
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 451a1071daf4..ff81c0136224 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -417,13 +417,33 @@ static void nfsd4_free_file_rcu(struct rcu_head *rcu)
>  	kmem_cache_free(file_slab, fp);
>  }
>  
> +/* hash table for nfs4_file */
> +#define FILE_HASH_SIZE		256
> +
> +static u32 nfsd4_file_key_hash(const void *data, u32 len, u32 seed);
> +static u32 nfsd4_file_obj_hash(const void *data, u32 len, u32 seed);
> +static int nfsd4_file_obj_compare(struct rhashtable_compare_arg *arg,
> +				  const void *obj);
> +
> +static const struct rhashtable_params file_rhashparams = {
> +	.head_offset		= offsetof(struct nfs4_file, fi_hash),
> +	.min_size		= FILE_HASH_SIZE,
> +	.automatic_shrinking	= true,
> +	.hashfn			= nfsd4_file_key_hash,
> +	.obj_hashfn		= nfsd4_file_obj_hash,
> +	.obj_cmpfn		= nfsd4_file_obj_compare,
> +};
> +
> +struct rhashtable file_hashtbl;
> +
>  void
>  put_nfs4_file(struct nfs4_file *fi)
>  {
>  	might_lock(&state_lock);
>  
>  	if (refcount_dec_and_lock(&fi->fi_ref, &state_lock)) {
> -		hlist_del_rcu(&fi->fi_hash);
> +		rhashtable_remove_fast(&file_hashtbl, &fi->fi_hash,
> +				       file_rhashparams);
>  		spin_unlock(&state_lock);
>  		WARN_ON_ONCE(!list_empty(&fi->fi_clnt_odstate));
>  		WARN_ON_ONCE(!list_empty(&fi->fi_delegations));
> @@ -527,21 +547,33 @@ static unsigned int ownerstr_hashval(struct xdr_netobj *ownername)
>  	return ret & OWNER_HASH_MASK;
>  }
>  
> -/* hash table for nfs4_file */
> -#define FILE_HASH_BITS                   8
> -#define FILE_HASH_SIZE                  (1 << FILE_HASH_BITS)
> -
> -static unsigned int nfsd_fh_hashval(struct knfsd_fh *fh)
> +static u32 nfsd4_file_key_hash(const void *data, u32 len, u32 seed)
>  {
> -	return jhash2(fh->fh_base.fh_pad, XDR_QUADLEN(fh->fh_size), 0);
> +	struct knfsd_fh *fh = (struct knfsd_fh *)data;
> +
> +	return jhash2(fh->fh_base.fh_pad, XDR_QUADLEN(fh->fh_size), seed);
>  }
>  
> -static unsigned int file_hashval(struct knfsd_fh *fh)
> +static u32 nfsd4_file_obj_hash(const void *data, u32 len, u32 seed)
>  {
> -	return nfsd_fh_hashval(fh) & (FILE_HASH_SIZE - 1);
> +	struct nfs4_file *fp = (struct nfs4_file *)data;
> +	struct knfsd_fh *fh;
> +
> +	fh = &fp->fi_fhandle;
> +
> +	return jhash2(fh->fh_base.fh_pad, XDR_QUADLEN(fh->fh_size), seed);
>  }
>  
> -static struct hlist_head file_hashtbl[FILE_HASH_SIZE];
> +static int nfsd4_file_obj_compare(struct rhashtable_compare_arg *arg,
> +				  const void *obj)
> +{
> +	struct nfs4_file *fp = (struct nfs4_file *)obj;
> +
> +	if (fh_match(&fp->fi_fhandle, (struct knfsd_fh *)arg->key))
> +		return 0;
> +
> +	return 1;
> +}
>  
>  static void
>  __nfs4_file_get_access(struct nfs4_file *fp, u32 access)
> @@ -4042,8 +4074,7 @@ static struct nfs4_file *nfsd4_alloc_file(void)
>  }
>  
>  /* OPEN Share state helper functions */
> -static void nfsd4_init_file(struct knfsd_fh *fh, unsigned int hashval,
> -				struct nfs4_file *fp)
> +static void nfsd4_init_file(struct knfsd_fh *fh, struct nfs4_file *fp)
>  {
>  	lockdep_assert_held(&state_lock);
>  
> @@ -4062,7 +4093,6 @@ static void nfsd4_init_file(struct knfsd_fh *fh, unsigned int hashval,
>  	INIT_LIST_HEAD(&fp->fi_lo_states);
>  	atomic_set(&fp->fi_lo_recalls, 0);
>  #endif
> -	hlist_add_head_rcu(&fp->fi_hash, &file_hashtbl[hashval]);
>  }
>  
>  void
> @@ -4126,6 +4156,18 @@ nfsd4_init_slabs(void)
>  	return -ENOMEM;
>  }
>  
> +int
> +nfsd4_init_hash(void)
> +{
> +	return rhashtable_init(&file_hashtbl, &file_rhashparams);
> +}
> +
> +void
> +nfsd4_free_hash(void)
> +{
> +	rhashtable_destroy(&file_hashtbl);
> +}
> +
>  static void init_nfs4_replay(struct nfs4_replay *rp)
>  {
>  	rp->rp_status = nfserr_serverfault;
> @@ -4395,30 +4437,19 @@ move_to_close_lru(struct nfs4_ol_stateid *s, struct net *net)
>  }
>  
>  /* search file_hashtbl[] for file */
> -static struct nfs4_file *
> -find_file_locked(struct knfsd_fh *fh, unsigned int hashval)
> -{
> -	struct nfs4_file *fp;
> -
> -	hlist_for_each_entry_rcu(fp, &file_hashtbl[hashval], fi_hash,
> -				lockdep_is_held(&state_lock)) {
> -		if (fh_match(&fp->fi_fhandle, fh)) {
> -			if (refcount_inc_not_zero(&fp->fi_ref))
> -				return fp;
> -		}
> -	}
> -	return NULL;
> -}
> -
>  struct nfs4_file *
>  find_file(struct knfsd_fh *fh)
>  {
>  	struct nfs4_file *fp;
> -	unsigned int hashval = file_hashval(fh);
>  
>  	rcu_read_lock();
> -	fp = find_file_locked(fh, hashval);
> +	fp = rhashtable_lookup(&file_hashtbl, fh, file_rhashparams);
> +	if (fp) {
> +		if (IS_ERR(fp) || refcount_inc_not_zero(&fp->fi_ref))
> +			fp = NULL;
> +	}
>  	rcu_read_unlock();
> +
>  	return fp;
>  }
>  
> @@ -4426,22 +4457,27 @@ static struct nfs4_file *
>  find_or_add_file(struct nfs4_file *new, struct knfsd_fh *fh)
>  {
>  	struct nfs4_file *fp;
> -	unsigned int hashval = file_hashval(fh);
>  
> -	rcu_read_lock();
> -	fp = find_file_locked(fh, hashval);
> -	rcu_read_unlock();
> +	fp = find_file(fh);
>  	if (fp)
>  		return fp;
>  
> +	nfsd4_init_file(fh, new);
> +
>  	spin_lock(&state_lock);
> -	fp = find_file_locked(fh, hashval);
> -	if (likely(fp == NULL)) {
> -		nfsd4_init_file(fh, hashval, new);
> +
> +	fp = rhashtable_lookup_get_insert_key(&file_hashtbl, &new->fi_fhandle,
> +	    &new->fi_hash, file_rhashparams);
> +	if (likely(fp == NULL))
>  		fp = new;
> -	}
> +	else if (IS_ERR(fp))
> +		fp = NULL;
> +	else
> +		refcount_inc(&fp->fi_ref);
> +
>  	spin_unlock(&state_lock);
>  
> +
>  	return fp;
>  }
>  
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index b68e96681522..bac5d8cff1d3 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -1528,9 +1528,12 @@ static int __init init_nfsd(void)
>  	retval = nfsd4_init_slabs();
>  	if (retval)
>  		goto out_unregister_notifier;
> -	retval = nfsd4_init_pnfs();
> +	retval = nfsd4_init_hash();
>  	if (retval)
>  		goto out_free_slabs;
> +	retval = nfsd4_init_pnfs();
> +	if (retval)
> +		goto out_free_hash;
>  	nfsd_fault_inject_init(); /* nfsd fault injection controls */
>  	nfsd_stat_init();	/* Statistics */
>  	retval = nfsd_drc_slab_create();
> @@ -1554,6 +1557,8 @@ static int __init init_nfsd(void)
>  	nfsd_stat_shutdown();
>  	nfsd_fault_inject_cleanup();
>  	nfsd4_exit_pnfs();
> +out_free_hash:
> +	nfsd4_free_hash();
>  out_free_slabs:
>  	nfsd4_free_slabs();
>  out_unregister_notifier:
> diff --git a/fs/nfsd/nfsd.h b/fs/nfsd/nfsd.h
> index 5343c771da18..fb0349d16158 100644
> --- a/fs/nfsd/nfsd.h
> +++ b/fs/nfsd/nfsd.h
> @@ -141,6 +141,8 @@ nfsd_user_namespace(const struct svc_rqst *rqstp)
>  extern unsigned long max_delegations;
>  int nfsd4_init_slabs(void);
>  void nfsd4_free_slabs(void);
> +int nfsd4_init_hash(void);
> +void nfsd4_free_hash(void);
>  int nfs4_state_start(void);
>  int nfs4_state_start_net(struct net *net);
>  void nfs4_state_shutdown(void);
> @@ -151,6 +153,8 @@ bool nfsd4_spo_must_allow(struct svc_rqst *rqstp);
>  #else
>  static inline int nfsd4_init_slabs(void) { return 0; }
>  static inline void nfsd4_free_slabs(void) { }
> +static inline int nfsd4_init_hash(void) { return 0; }
> +static inline void nfsd4_free_hash(void) { }
>  static inline int nfs4_state_start(void) { return 0; }
>  static inline int nfs4_state_start_net(struct net *net) { return 0; }
>  static inline void nfs4_state_shutdown(void) { }
> diff --git a/fs/nfsd/state.h b/fs/nfsd/state.h
> index 3b408532a5dc..bf66244a7a2d 100644
> --- a/fs/nfsd/state.h
> +++ b/fs/nfsd/state.h
> @@ -38,6 +38,7 @@
>  #include <linux/idr.h>
>  #include <linux/refcount.h>
>  #include <linux/sunrpc/svc_xprt.h>
> +#include <linux/rhashtable.h>
>  #include "nfsfh.h"
>  #include "nfsd.h"
>  
> @@ -513,7 +514,7 @@ struct nfs4_clnt_odstate {
>  struct nfs4_file {
>  	refcount_t		fi_ref;
>  	spinlock_t		fi_lock;
> -	struct hlist_node       fi_hash;	/* hash on fi_fhandle */
> +	struct rhash_head	fi_hash;	/* hash on fi_fhandle */
>  	struct list_head        fi_stateids;
>  	union {
>  		struct list_head	fi_delegations;
> -- 
> 2.17.2
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

