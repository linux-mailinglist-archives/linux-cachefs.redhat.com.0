Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D1790F79
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Sep 2023 03:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693789368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hez9kVD1Da46EW7USjf4Ga8qG3Q+jnLyH36prjkGj08=;
	b=ZPDJjgESsvkh70kz0rREInAM9pFi3dCNrsAmbxDMi0VBO/NXk4qSbA9IZfu1Ggr5v+QgBC
	TN/1++B1vfYmtUsDjYJHThCkJXlx83f2mkf9lhVrUURqz3yHWJrp93x4cBQLQ5AstWLAwf
	kRGRGNqnfVKzAgRD6cDTqKYiXZ4ME74=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-BoeAkCuwNEyYCZvHoIV8Fg-1; Sun, 03 Sep 2023 21:02:45 -0400
X-MC-Unique: BoeAkCuwNEyYCZvHoIV8Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D88CD29AB3F0;
	Mon,  4 Sep 2023 01:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71FA41182D4;
	Mon,  4 Sep 2023 01:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24A3E19465B7;
	Mon,  4 Sep 2023 01:02:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 06D351946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  4 Sep 2023 01:02:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2A6C7B62; Mon,  4 Sep 2023 01:02:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D0D1182D4
 for <linux-cachefs@redhat.com>; Mon,  4 Sep 2023 01:02:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B82161817903
 for <linux-cachefs@redhat.com>; Mon,  4 Sep 2023 01:02:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-L2AfuHB6OkuJxVGWsTHetw-1; Sun, 03 Sep 2023 21:02:37 -0400
X-MC-Unique: L2AfuHB6OkuJxVGWsTHetw-1
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso2041545ad.0
 for <linux-cachefs@redhat.com>; Sun, 03 Sep 2023 18:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693789356; x=1694394156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=;
 b=jhE9+iSGy1XmY47yLEyltnWVHNxs5/w9F+F37ooxfPyVpueHCQ2rWlHo2ZgQrKGajc
 rOQ27xTCy9E+r7rP+hbmqrADpOccem+g/JsIs9tzI07MkIlLvokDYycSGfHIkYCDeYoo
 3ct5VsAzLpnp+BjFvgxJf+/LfZBCYlhEuwydiSz9uvLnfSUMtyr0du2n4yq+45qTf+eX
 cZtyGrhUbr4FYREOHBAQ1VbhJV/0YLBXZUY7tVFjUl4XnlznpVYDsISOs5NEmwglkpv0
 wdhky5znDlTqsRTk4deiAHxV/8eSM20LDWCANglqGayzWl7jaxJK5I0YFY4LsSQ8BwW/
 Db8Q==
X-Gm-Message-State: AOJu0YzvoL7DXlDxUJz6V/9sm6oXSOjbaVUCQDY0bMVB5v8aKC0npUv5
 AaM45Z9K0FyGkGnE1qHN9dJ4bQ==
X-Google-Smtp-Source: AGHT+IGGrky2P+bBuH4AKgWBeYdqXOP6u+qaOJyeKMBTbWb7BRdsdnk0jjxmGVwySX0sZe8eaRNDcw==
X-Received: by 2002:a17:902:ecc8:b0:1c1:fe97:bf34 with SMTP id
 a8-20020a170902ecc800b001c1fe97bf34mr8040994plh.24.1693789355853; 
 Sun, 03 Sep 2023 18:02:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170902c18400b001bdcafcf8d3sm6351806pld.69.2023.09.03.18.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 18:02:35 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qcxz6-00AVA9-2L;
 Mon, 04 Sep 2023 11:02:32 +1000
Date: Mon, 4 Sep 2023 11:02:32 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZPUsqGfeUwupdlLE@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230827132835.1373581-3-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH 02/11] xfs: add NOWAIT semantics for
 readdir
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Implement NOWAIT semantics for readdir. Return EAGAIN error to the
> caller if it would block, like failing to get locks, or going to
> do IO.
> 
> Co-developed-by: Dave Chinner <dchinner@redhat.com>

Not really.

"Co-developed" implies equal development input between all the
parties, which is not the case here - this patch is based on
prototype I wrote, whilst you're doing the refining, testing and
correctness work.

In these cases with XFS code, we add a line in the commit message to
say:

"This is based on a patch originally written by Dave Chinner."


> Signed-off-by: Dave Chinner <dchinner@redhat.com>
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> [fixes deadlock issue, tweak code style]

With a signoff chain like you already have.

In the end you'll also get a RVB from me, which seems rather wrong
to me if I've apparently been "co-developing" the code....

....

> @@ -156,7 +157,9 @@ xfs_dir2_block_getdents(
>  	if (xfs_dir2_dataptr_to_db(geo, ctx->pos) > geo->datablk)
>  		return 0;
>  
> -	error = xfs_dir3_block_read(args->trans, dp, &bp);
> +	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> +		flags |= XFS_DABUF_NOWAIT;
> +	error = xfs_dir3_block_read(args->trans, dp, flags, &bp);
>  	if (error)
>  		return error;
>  

Given we do this same check in both block and leaf formats to set
XFS_DABUF_NOWAIT, and we do the DIR_CONTEXT_F_NOWAIT check in
xfs_readdir() as well, we should probably do this check once at the
higher level and pass flags down from there with XFS_DABUF_NOWAIT
already set.

> @@ -240,6 +243,7 @@ xfs_dir2_block_getdents(
>  STATIC int
>  xfs_dir2_leaf_readbuf(
>  	struct xfs_da_args	*args,
> +	struct dir_context	*ctx,
>  	size_t			bufsize,
>  	xfs_dir2_off_t		*cur_off,
>  	xfs_dablk_t		*ra_blk,
> @@ -258,10 +262,15 @@ xfs_dir2_leaf_readbuf(
>  	struct xfs_iext_cursor	icur;
>  	int			ra_want;
>  	int			error = 0;
> -
> -	error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
> -	if (error)
> -		goto out;
> +	unsigned int		flags = 0;
> +
> +	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
> +		flags |= XFS_DABUF_NOWAIT;
> +	} else {
> +		error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
> +		if (error)
> +			goto out;
> +	}

Especially as, in hindsight, this doesn't make a whole lot of sense.
If XFS_DABUF_NOWAIT is set, we keep going until
xfs_ilock_data_map_shared_nowait() where we call
xfs_need_iread_extents() to see if we need to read the extents in
and abort at that point.

So, really, we shouldn't get this far with nowait semantics if
we haven't read the extents in yet - we're supposed to already have
the inode locked here and so we should have already checked this
condition before we bother locking the inode...

i.e. all we should be doing here is this:

	if (!(flags & XFS_DABUF_NOWAIT)) {
		error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
		if (error)
			goto out;
	}

And then we don't need to pass the VFS dir_context down into low
level XFS functions unnecessarily.


>  
>  	/*
>  	 * Look for mapped directory blocks at or above the current offset.
> @@ -280,7 +289,7 @@ xfs_dir2_leaf_readbuf(
>  	new_off = xfs_dir2_da_to_byte(geo, map.br_startoff);
>  	if (new_off > *cur_off)
>  		*cur_off = new_off;
> -	error = xfs_dir3_data_read(args->trans, dp, map.br_startoff, 0, &bp);
> +	error = xfs_dir3_data_read(args->trans, dp, map.br_startoff, flags, &bp);
>  	if (error)
>  		goto out;
>  
> @@ -360,6 +369,7 @@ xfs_dir2_leaf_getdents(
>  	int			byteoff;	/* offset in current block */
>  	unsigned int		offset = 0;
>  	int			error = 0;	/* error return value */
> +	int			written = 0;
>  
>  	/*
>  	 * If the offset is at or past the largest allowed value,
> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>  				bp = NULL;
>  			}
>  
> -			if (*lock_mode == 0)
> -				*lock_mode = xfs_ilock_data_map_shared(dp);
> -			error = xfs_dir2_leaf_readbuf(args, bufsize, &curoff,
> -					&rablk, &bp);
> +			if (*lock_mode == 0) {
> +				*lock_mode =
> +					xfs_ilock_data_map_shared_generic(dp,
> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> +				if (!*lock_mode) {
> +					error = -EAGAIN;
> +					break;
> +				}
> +			}
> +			error = xfs_dir2_leaf_readbuf(args, ctx, bufsize,
> +					&curoff, &rablk, &bp);

int
xfs_ilock_readdir(
	struct xfs_inode	*ip,
	int			flags)
{
	if (flags & XFS_DABUF_NOWAIT) {
		if (!xfs_ilock_nowait(dp, XFS_ILOCK_SHARED))
			return -EAGAIN;
		return XFS_ILOCK_SHARED;
	}
	return xfs_ilock_data_map_shared(dp);
}

And then this code simply becomes:

			if (*lock_mode == 0)
				*lock_mode = xfs_ilock_readdir(ip, flags);


>  			if (error || !bp)
>  				break;
>  
> @@ -479,6 +496,7 @@ xfs_dir2_leaf_getdents(
>  		 */
>  		offset += length;
>  		curoff += length;
> +		written += length;
>  		/* bufsize may have just been a guess; don't go negative */
>  		bufsize = bufsize > length ? bufsize - length : 0;
>  	}
> @@ -492,6 +510,8 @@ xfs_dir2_leaf_getdents(
>  		ctx->pos = xfs_dir2_byte_to_dataptr(curoff) & 0x7fffffff;
>  	if (bp)
>  		xfs_trans_brelse(args->trans, bp);
> +	if (error == -EAGAIN && written > 0)
> +		error = 0;
>  	return error;
>  }
>  
> @@ -514,6 +534,7 @@ xfs_readdir(
>  	unsigned int		lock_mode;
>  	bool			isblock;
>  	int			error;
> +	bool			nowait;
>  
>  	trace_xfs_readdir(dp);
>  
> @@ -531,7 +552,11 @@ xfs_readdir(
>  	if (dp->i_df.if_format == XFS_DINODE_FMT_LOCAL)
>  		return xfs_dir2_sf_getdents(&args, ctx);
>  
> -	lock_mode = xfs_ilock_data_map_shared(dp);
> +	nowait = ctx->flags & DIR_CONTEXT_F_NOWAIT;
> +	lock_mode = xfs_ilock_data_map_shared_generic(dp, nowait);
> +	if (!lock_mode)
> +		return -EAGAIN;
> +

Given what I said above:

	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
		/*
		 * If we need to read extents, then we must do IO
		 * and we must use exclusive locking. We don't want
		 * to do either of those things, so just bail if we
		 * have to read extents. Doing this check explicitly
		 * here means we don't have to do it anywhere else
		 * in the XFS_DABUF_NOWAIT path.
		 */
		if (xfs_need_iread_extents(&ip->i_df))
			return -EAGAIN;
		flags |= XFS_DABUF_NOWAIT;
	}
	lock_mode = xfs_ilock_readdir(dp, flags);

And with this change, we probably should be marking the entire
operation as having nowait semantics. i.e. using args->op_flags here
and only use XFS_DABUF_NOWAIT for the actual IO. ie.

		args->op_flags |= XFS_DA_OP_NOWAIT;

This makes it clear that the entire directory op should run under
NOWAIT constraints, and it avoids needing to pass an extra flag
through the stack.  That then makes the readdir locking function
look like this:

/*
 * When we are locking an inode for readdir, we need to ensure that
 * the extents have been read in first. This requires the inode to
 * be locked exclusively across the extent read, but otherwise we
 * want to use shared locking.
 *
 * For XFS_DA_OP_NOWAIT operations, we do an up-front check to see
 * if the extents have been read in, so all we need to do in this
 * case is a shared try-lock as we never need exclusive locking in
 * this path.
 */
static int
xfs_ilock_readdir(
	struct xfs_da_args	*args)
{
	if (args->op_flags & XFS_DA_OP_NOWAIT) {
		if (!xfs_ilock_nowait(args->dp, XFS_ILOCK_SHARED))
			return -EAGAIN;
		return XFS_ILOCK_SHARED;
	}
	return xfs_ilock_data_map_shared(args->dp);
}

> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 9e62cc500140..d088f7d0c23a 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -120,6 +120,33 @@ xfs_ilock_data_map_shared(
>  	return lock_mode;
>  }
>  
> +/*
> + * Similar to xfs_ilock_data_map_shared(), except that it will only try to lock
> + * the inode in shared mode if the extents are already in memory. If it fails to
> + * get the lock or has to do IO to read the extent list, fail the operation by
> + * returning 0 as the lock mode.
> + */
> +uint
> +xfs_ilock_data_map_shared_nowait(
> +	struct xfs_inode	*ip)
> +{
> +	if (xfs_need_iread_extents(&ip->i_df))
> +		return 0;
> +	if (!xfs_ilock_nowait(ip, XFS_ILOCK_SHARED))
> +		return 0;
> +	return XFS_ILOCK_SHARED;
> +}
> +
> +int
> +xfs_ilock_data_map_shared_generic(
> +	struct xfs_inode	*dp,
> +	bool			nowait)
> +{
> +	if (nowait)
> +		return xfs_ilock_data_map_shared_nowait(dp);
> +	return xfs_ilock_data_map_shared(dp);
> +}

And all this "generic" locking stuff goes away.

FWIW, IMO, "generic" is a poor name for an XFS function as there's
nothing "generic" in XFS.  We tend name the functions after what
they do, not some abstract concept. Leave "generic" as a keyword for
widely used core infrastructure functions, not niche, one-off use
cases like this.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

