Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 45CBE2B6ABA
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Nov 2020 17:55:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-HHYepYZsNJOasTzoXC3g7w-1; Tue, 17 Nov 2020 11:55:31 -0500
X-MC-Unique: HHYepYZsNJOasTzoXC3g7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401B4802B61;
	Tue, 17 Nov 2020 16:55:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09E801001E73;
	Tue, 17 Nov 2020 16:55:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5B3A5813B;
	Tue, 17 Nov 2020 16:55:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHFPi5Y020001 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 10:25:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 23671110F0B4; Tue, 17 Nov 2020 15:25:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F1E6110F0B0
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 15:25:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C5058015A6
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 15:25:41 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-501-lcj4Xf3fPcewwLxRTWePrg-1;
	Tue, 17 Nov 2020 10:25:38 -0500
X-MC-Unique: lcj4Xf3fPcewwLxRTWePrg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 6A7201C21; Tue, 17 Nov 2020 10:25:37 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 6A7201C21
Date: Tue, 17 Nov 2020 10:25:37 -0500
To: "J. Bruce Fields" <bfields@redhat.com>
Message-ID: <20201117152537.GB4556@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
	<1605583086-19869-2-git-send-email-bfields@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1605583086-19869-2-git-send-email-bfields@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
From: bfields@fieldses.org (J. Bruce Fields)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	Jeff Layton <jlayton@kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 2/4] nfsd: pre/post attr is using wrong
	change attribute
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 10:18:04PM -0500, J. Bruce Fields wrote:
> From: "J. Bruce Fields" <bfields@redhat.com>
> 
> fill_{pre/post}_attr are unconditionally using i_version even when the
> underlying filesystem doesn't have proper support for i_version.

Actually, I didn't have this quite right....

These values are queried, but they aren't used, thanks to the
"change_supported" field of nfsd4_change_info; in set_change_info():

	cinfo->change_supported = IS_I_VERSION(d_inode(fhp->fh_dentry));

and then later on encode_cinfo() chooses to use stored change attribute
or ctime values depending on how change_supported.

But as of the ctime changes, just querying the change attribute here has
side effects.

So, that explains why Daire's team was seeing a performance regression,
while no one was complaining about our returned change info being
garbage.

Anyway.

--b.

> 
> Move the code that chooses which i_version to use to the common
> nfsd4_change_attribute().
> 
> The NFSEXP_V4ROOT case probably doesn't matter (the pseudoroot
> filesystem is usually read-only and unlikely to see operations with pre
> and post change attributes), but let's put it in the same place anyway
> for consistency.
> 
> Fixes: c654b8a9cba6 ("nfsd: support ext4 i_version")
> Signed-off-by: J. Bruce Fields <bfields@redhat.com>
> ---
>  fs/nfsd/nfs4xdr.c | 11 +----------
>  fs/nfsd/nfsfh.c   | 11 +++++++----
>  fs/nfsd/nfsfh.h   | 23 -----------------------
>  fs/nfsd/vfs.c     | 32 ++++++++++++++++++++++++++++++++
>  fs/nfsd/vfs.h     |  3 +++
>  5 files changed, 43 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
> index 833a2c64dfe8..6806207b6d18 100644
> --- a/fs/nfsd/nfs4xdr.c
> +++ b/fs/nfsd/nfs4xdr.c
> @@ -2295,16 +2295,7 @@ nfsd4_decode_compound(struct nfsd4_compoundargs *argp)
>  static __be32 *encode_change(__be32 *p, struct kstat *stat, struct inode *inode,
>  			     struct svc_export *exp)
>  {
> -	if (exp->ex_flags & NFSEXP_V4ROOT) {
> -		*p++ = cpu_to_be32(convert_to_wallclock(exp->cd->flush_time));
> -		*p++ = 0;
> -	} else if (IS_I_VERSION(inode)) {
> -		p = xdr_encode_hyper(p, nfsd4_change_attribute(stat, inode));
> -	} else {
> -		*p++ = cpu_to_be32(stat->ctime.tv_sec);
> -		*p++ = cpu_to_be32(stat->ctime.tv_nsec);
> -	}
> -	return p;
> +	return xdr_encode_hyper(p, nfsd4_change_attribute(stat, inode, exp));
>  }
>  
>  /*
> diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
> index b3b4e8809aa9..4fbe1413e767 100644
> --- a/fs/nfsd/nfsfh.c
> +++ b/fs/nfsd/nfsfh.c
> @@ -719,6 +719,7 @@ void fill_pre_wcc(struct svc_fh *fhp)
>  {
>  	struct inode    *inode;
>  	struct kstat	stat;
> +	struct svc_export *exp = fhp->fh_export;
>  	__be32 err;
>  
>  	if (fhp->fh_pre_saved)
> @@ -736,7 +737,7 @@ void fill_pre_wcc(struct svc_fh *fhp)
>  	fhp->fh_pre_mtime = stat.mtime;
>  	fhp->fh_pre_ctime = stat.ctime;
>  	fhp->fh_pre_size  = stat.size;
> -	fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode);
> +	fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode, exp);
>  	fhp->fh_pre_saved = true;
>  }
>  
> @@ -746,17 +747,19 @@ void fill_pre_wcc(struct svc_fh *fhp)
>  void fill_post_wcc(struct svc_fh *fhp)
>  {
>  	__be32 err;
> +	struct inode *inode = d_inode(fhp->fh_dentry);
> +	struct svc_export *exp = fhp->fh_export;
>  
>  	if (fhp->fh_post_saved)
>  		printk("nfsd: inode locked twice during operation.\n");
>  
>  	err = fh_getattr(fhp, &fhp->fh_post_attr);
> -	fhp->fh_post_change = nfsd4_change_attribute(&fhp->fh_post_attr,
> -						     d_inode(fhp->fh_dentry));
> +	fhp->fh_post_change =
> +			nfsd4_change_attribute(&fhp->fh_post_attr, inode, exp);
>  	if (err) {
>  		fhp->fh_post_saved = false;
>  		/* Grab the ctime anyway - set_change_info might use it */
> -		fhp->fh_post_attr.ctime = d_inode(fhp->fh_dentry)->i_ctime;
> +		fhp->fh_post_attr.ctime = inode->i_ctime;
>  	} else
>  		fhp->fh_post_saved = true;
>  }
> diff --git a/fs/nfsd/nfsfh.h b/fs/nfsd/nfsfh.h
> index 56cfbc361561..547aef9b3265 100644
> --- a/fs/nfsd/nfsfh.h
> +++ b/fs/nfsd/nfsfh.h
> @@ -245,29 +245,6 @@ fh_clear_wcc(struct svc_fh *fhp)
>  	fhp->fh_pre_saved = false;
>  }
>  
> -/*
> - * We could use i_version alone as the change attribute.  However,
> - * i_version can go backwards after a reboot.  On its own that doesn't
> - * necessarily cause a problem, but if i_version goes backwards and then
> - * is incremented again it could reuse a value that was previously used
> - * before boot, and a client who queried the two values might
> - * incorrectly assume nothing changed.
> - *
> - * By using both ctime and the i_version counter we guarantee that as
> - * long as time doesn't go backwards we never reuse an old value.
> - */
> -static inline u64 nfsd4_change_attribute(struct kstat *stat,
> -					 struct inode *inode)
> -{
> -	u64 chattr;
> -
> -	chattr =  stat->ctime.tv_sec;
> -	chattr <<= 30;
> -	chattr += stat->ctime.tv_nsec;
> -	chattr += inode_query_iversion(inode);
> -	return chattr;
> -}
> -
>  extern void fill_pre_wcc(struct svc_fh *fhp);
>  extern void fill_post_wcc(struct svc_fh *fhp);
>  #else
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index 1ecaceebee13..2c71b02dd1fe 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -2390,3 +2390,35 @@ nfsd_permission(struct svc_rqst *rqstp, struct svc_export *exp,
>  
>  	return err? nfserrno(err) : 0;
>  }
> +
> +/*
> + * We could use i_version alone as the change attribute.  However,
> + * i_version can go backwards after a reboot.  On its own that doesn't
> + * necessarily cause a problem, but if i_version goes backwards and then
> + * is incremented again it could reuse a value that was previously used
> + * before boot, and a client who queried the two values might
> + * incorrectly assume nothing changed.
> + *
> + * By using both ctime and the i_version counter we guarantee that as
> + * long as time doesn't go backwards we never reuse an old value.
> + */
> +u64 nfsd4_change_attribute(struct kstat *stat, struct inode *inode,
> +					 struct svc_export *exp)
> +{
> +	u64 chattr;
> +
> +	if (exp->ex_flags & NFSEXP_V4ROOT) {
> +		chattr = cpu_to_be32(convert_to_wallclock(exp->cd->flush_time));
> +		chattr <<= 32;
> +	} else if (IS_I_VERSION(inode)) {
> +		chattr = stat->ctime.tv_sec;
> +		chattr <<= 30;
> +		chattr += stat->ctime.tv_nsec;
> +		chattr += inode_query_iversion(inode);
> +	} else {
> +		chattr = stat->ctime.tv_sec;
> +		chattr <<= 32;
> +		chattr += stat->ctime.tv_nsec;
> +	}
> +	return chattr;
> +}
> diff --git a/fs/nfsd/vfs.h b/fs/nfsd/vfs.h
> index a2442ebe5acf..26ed15256340 100644
> --- a/fs/nfsd/vfs.h
> +++ b/fs/nfsd/vfs.h
> @@ -132,6 +132,9 @@ __be32		nfsd_statfs(struct svc_rqst *, struct svc_fh *,
>  __be32		nfsd_permission(struct svc_rqst *, struct svc_export *,
>  				struct dentry *, int);
>  
> +u64		nfsd4_change_attribute(struct kstat *stat, struct inode *inode,
> +				struct svc_export *exp);
> +
>  static inline int fh_want_write(struct svc_fh *fh)
>  {
>  	int ret;
> -- 
> 2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

