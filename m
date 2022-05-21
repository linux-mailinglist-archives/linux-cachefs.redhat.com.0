Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A052FDF8
	for <lists+linux-cachefs@lfdr.de>; Sat, 21 May 2022 17:48:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-bTJ5xoaKPJSiKeUWtj7S1Q-1; Sat, 21 May 2022 11:48:12 -0400
X-MC-Unique: bTJ5xoaKPJSiKeUWtj7S1Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90B22811E75;
	Sat, 21 May 2022 15:48:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64B1D40316C;
	Sat, 21 May 2022 15:48:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F3DFE194705B;
	Sat, 21 May 2022 15:48:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C804F1947040 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 21 May 2022 15:48:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 969B140E6A45; Sat, 21 May 2022 15:48:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92C7340E6A41
 for <linux-cachefs@redhat.com>; Sat, 21 May 2022 15:48:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4711C05ABD
 for <linux-cachefs@redhat.com>; Sat, 21 May 2022 15:48:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-usdpGdclOMq_a3wrOfpYHg-1; Sat, 21 May 2022 11:48:05 -0400
X-MC-Unique: usdpGdclOMq_a3wrOfpYHg-1
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsR5D-00EjdF-Jk; Sat, 21 May 2022 15:31:59 +0000
Message-ID: <c02b4ae7-218e-2349-afcb-9ada25beb934@infradead.org>
Date: Sat, 21 May 2022 08:31:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Khalid Masum <khalid.masum.92@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20220521142446.4746-1-khalid.masum.92@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220521142446.4746-1-khalid.masum.92@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH] fscache: fix misdocumented parameter
 name
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
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 5/21/22 07:24, Khalid Masum wrote:
> To fix warning generated by make docs in the file fscache.h:
> The functions fscache_use_cookie and fscache_unuse_cookie have a
> parameter named cookie. But they are documented with the name "object".
> Which generates warning when creating docs. This commit will replace
> the documentation with a better one named "cookie". This new
> documentation
> line is taken from the function fscache_update_cookie in the same
> file.
> 
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/linux/fscache.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/fscache.h b/include/linux/fscache.h
> index e25539072..32cf593b8 100644
> --- a/include/linux/fscache.h
> +++ b/include/linux/fscache.h
> @@ -256,7 +256,7 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
>  
>  /**
>   * fscache_use_cookie - Request usage of cookie attached to an object
> - * @object: Object description
> + * @cookie: The cookie representing the cache object
>   * @will_modify: If cache is expected to be modified locally
>   *
>   * Request usage of the cookie attached to an object.  The caller should tell
> @@ -272,7 +272,7 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
>  
>  /**
>   * fscache_unuse_cookie - Cease usage of cookie attached to an object
> - * @object: Object description
> + * @cookie: The cookie representing the cache object
>   * @aux_data: Updated auxiliary data (or NULL)
>   * @object_size: Revised size of the object (or NULL)
>   *

-- 
~Randy

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

