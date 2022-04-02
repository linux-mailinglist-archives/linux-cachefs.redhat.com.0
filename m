Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1964F1015
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Apr 2022 09:40:46 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-67WEX-u-MgCC6bR3v-4tlw-1; Mon, 04 Apr 2022 03:40:42 -0400
X-MC-Unique: 67WEX-u-MgCC6bR3v-4tlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0CF48117B0;
	Mon,  4 Apr 2022 07:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 096AE40F1C37;
	Mon,  4 Apr 2022 07:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE5D2194036A;
	Mon,  4 Apr 2022 07:40:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 553C0194035D for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  2 Apr 2022 09:33:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E86F558EFF; Sat,  2 Apr 2022 09:33:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ABAC558EF2
 for <linux-cachefs@redhat.com>; Sat,  2 Apr 2022 09:33:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 123991C05AB1
 for <linux-cachefs@redhat.com>; Sat,  2 Apr 2022 09:33:10 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-JCavNY3wNdGsuKiDHwBGyw-1; Sat, 02 Apr 2022 05:33:08 -0400
X-MC-Unique: JCavNY3wNdGsuKiDHwBGyw-1
Received: by mail-pg1-f172.google.com with SMTP id c2so4186924pga.10;
 Sat, 02 Apr 2022 02:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oIRSTzpeogZQegTxy3HsXL8f2cTTP9W4dlr8OKiUWvM=;
 b=3dGiGguj00cVlt4BLyrlGYR1gqp2AobcE4w1GAYCn5lGRR12bm45Yf4uiSNK31i6eT
 8313Hqw+NyNOUILeMuhAcb26OhabsZfnhF0g5gnws3g6VPaWX2ComHTR5I5uU7OwtdaW
 b0aeH9tkdU8oYPvCHO0Uw8yWQpEqT1433kXn4JIZdJqmiLwvpxQ1xbacSVsXRhyHctrT
 GbIh44UxxH97/a+SxXHO8wE2Ua29GA5EuPAbi1RLeGy1ew7hMnViyXumUZ2mAFcMr93j
 mo/Ls6RjNUqG4D23XdjQx4enqQICj6HhsJ8ZkKhIDCCM8PBg7UQMJi5/c177WGpK1WdE
 vbuA==
X-Gm-Message-State: AOAM531Q+ZJeJA4e3sdWrBNzeDPQVX+Kp2jQG81VKh0c5aC/8Wm9mCdr
 z9GxJ1ajmWHx5AkxZpfr/LY=
X-Google-Smtp-Source: ABdhPJwTBN78sVwN2HktnnEhYPi7sExtecHxxHkCS/Jzrfc7VDfZ0PtiiKIkHMUvO3GW0yIF9EAOsg==
X-Received: by 2002:aa7:8d47:0:b0:4f6:a7f9:1ead with SMTP id
 s7-20020aa78d47000000b004f6a7f91eadmr14749693pfe.42.1648891987038; 
 Sat, 02 Apr 2022 02:33:07 -0700 (PDT)
Received: from localhost ([103.220.76.197]) by smtp.gmail.com with ESMTPSA id
 f66-20020a62db45000000b004fa8a7b8ad3sm5593956pfg.77.2022.04.02.02.33.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Apr 2022 02:33:06 -0700 (PDT)
Date: Sat, 2 Apr 2022 17:32:21 +0800
From: Yue Hu <zbestahu@gmail.com>
To: "Yue Hu" <huyue2@coolpad.com>
Message-ID: <20220402173221.00002170.zbestahu@gmail.com>
In-Reply-To: <20220402021841.22285-1-huyue2@coolpad.com>
References: <20220402021841.22285-1-huyue2@coolpad.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Mon, 04 Apr 2022 07:40:39 +0000
Subject: Re: [Linux-cachefs] [PATCH] fscache: Expose fscache_end_operation()
 helper
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
Cc: sfrench@samba.org, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 zbestahu@163.com, linux-cachefs@redhat.com, anna@kernel.org,
 zhangwen@coolpad.com, trond.myklebust@hammerspace.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 02 Apr 2022 10:18:55 +0800
"Yue Hu" <huyue2@coolpad.com> wrote:

> Currently, nfs and cifs have same fscache_end_operaion() as fscache.
> We may put the helper in linux/fscache.h so that fscache internal
> and client filesystem can all use it.

Sorry, please ignore the patch due to my earlier code base.

Thanks.

> 
> Signed-off-by: Yue Hu <huyue2@coolpad.com>
> ---
>  fs/cifs/fscache.c       |  8 --------
>  fs/fscache/internal.h   | 11 -----------
>  fs/nfs/fscache.c        |  8 --------
>  include/linux/fscache.h | 12 ++++++++++++
>  4 files changed, 12 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index 33af72e0ac0c..b47c2011ce5b 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -134,14 +134,6 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
>  	}
>  }
>  
> -static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> -{
> -	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> -
> -	if (ops)
> -		ops->end_operation(cres);
> -}
> -
>  /*
>   * Fallback page reading interface.
>   */
> diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
> index f121c21590dc..ed1c9ed737f2 100644
> --- a/fs/fscache/internal.h
> +++ b/fs/fscache/internal.h
> @@ -70,17 +70,6 @@ static inline void fscache_see_cookie(struct fscache_cookie *cookie,
>  			     where);
>  }
>  
> -/*
> - * io.c
> - */
> -static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> -{
> -	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> -
> -	if (ops)
> -		ops->end_operation(cres);
> -}
> -
>  /*
>   * main.c
>   */
> diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> index cfe901650ab0..39654ca72d3d 100644
> --- a/fs/nfs/fscache.c
> +++ b/fs/nfs/fscache.c
> @@ -249,14 +249,6 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
>  	}
>  }
>  
> -static inline void fscache_end_operation(struct netfs_cache_resources *cres)
> -{
> -	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> -
> -	if (ops)
> -		ops->end_operation(cres);
> -}
> -
>  /*
>   * Fallback page reading interface.
>   */
> diff --git a/include/linux/fscache.h b/include/linux/fscache.h
> index 296c5f1d9f35..79bb40b92e0f 100644
> --- a/include/linux/fscache.h
> +++ b/include/linux/fscache.h
> @@ -557,6 +557,18 @@ int fscache_write(struct netfs_cache_resources *cres,
>  	return ops->write(cres, start_pos, iter, term_func, term_func_priv);
>  }
>  
> +/*
> + * Clean up at the end of an operation
> + */
> +static inline
> +void fscache_end_operation(struct netfs_cache_resources *cres)
> +{
> +	const struct netfs_cache_ops *ops = fscache_operation_valid(cres);
> +
> +	if (ops)
> +		ops->end_operation(cres);
> +}
> +
>  /**
>   * fscache_clear_page_bits - Clear the PG_fscache bits from a set of pages
>   * @cookie: The cookie representing the cache object

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

