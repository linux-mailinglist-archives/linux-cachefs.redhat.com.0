Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4B4F51FC
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Apr 2022 04:45:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-bfy8xw05O0OQuWaaOBVuMQ-1; Tue, 05 Apr 2022 22:45:55 -0400
X-MC-Unique: bfy8xw05O0OQuWaaOBVuMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54B1C85A5A8;
	Wed,  6 Apr 2022 02:45:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05E8F403D1D1;
	Wed,  6 Apr 2022 02:45:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A84421940372;
	Wed,  6 Apr 2022 02:45:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C26A1940369 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 02:45:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC188401499F; Wed,  6 Apr 2022 02:45:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7EA24066C9F
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 02:45:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA5C185A79C
 for <linux-cachefs@redhat.com>; Wed,  6 Apr 2022 02:45:52 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-JmRWBzOMPp2abnEPv8nA3w-1; Tue, 05 Apr 2022 22:45:50 -0400
X-MC-Unique: JmRWBzOMPp2abnEPv8nA3w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0V9JmdQB_1649213146
Received: from 30.225.24.86(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9JmdQB_1649213146) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 06 Apr 2022 10:45:47 +0800
Message-ID: <1c6b191b-4a2e-0333-b0a3-f76bcd6b6515@linux.alibaba.com>
Date: Wed, 6 Apr 2022 10:45:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Yue Hu <huyue2@coolpad.com>, dhowells@redhat.com, linux-cachefs@redhat.com
References: <20220402044728.9669-1-huyue2@coolpad.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220402044728.9669-1-huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH] fscache: Move fscache_cookies_seq_ops
 specific code under CONFIG_PROC_FS
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
Cc: zbestahu@gmail.com, linux-kernel@vger.kernel.org, zbestahu@163.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/2/22 12:47 PM, Yue Hu wrote:
> fscache_cookies_seq_ops is only used in proc.c that is compiled under
> enabled CONFIG_PROC_FS, so move related code under this config. The
> same case exsits in internal.h.
> 
> Also, make fscache_lru_cookie_timeout static due to no user outside
> of cookie.c.
> 
> Signed-off-by: Yue Hu <huyue2@coolpad.com>
> ---
>  fs/fscache/cookie.c   | 4 +++-
>  fs/fscache/internal.h | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> index 9bb1ab5fe5ed..9d3cf0111709 100644
> --- a/fs/fscache/cookie.c
> +++ b/fs/fscache/cookie.c
> @@ -30,7 +30,7 @@ static DEFINE_SPINLOCK(fscache_cookie_lru_lock);
>  DEFINE_TIMER(fscache_cookie_lru_timer, fscache_cookie_lru_timed_out);
>  static DECLARE_WORK(fscache_cookie_lru_work, fscache_cookie_lru_worker);
>  static const char fscache_cookie_states[FSCACHE_COOKIE_STATE__NR] = "-LCAIFUWRD";
> -unsigned int fscache_lru_cookie_timeout = 10 * HZ;
> +static unsigned int fscache_lru_cookie_timeout = 10 * HZ;
>  
>  void fscache_print_cookie(struct fscache_cookie *cookie, char prefix)
>  {
> @@ -1069,6 +1069,7 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
>  }
>  EXPORT_SYMBOL(__fscache_invalidate);
>  
> +#ifdef CONFIG_PROC_FS
>  /*
>   * Generate a list of extant cookies in /proc/fs/fscache/cookies
>   */
> @@ -1145,3 +1146,4 @@ const struct seq_operations fscache_cookies_seq_ops = {
>  	.stop   = fscache_cookies_seq_stop,
>  	.show   = fscache_cookies_seq_show,
>  };
> +#endif

Then I'm afraid fscache_cookies_seq_stop() and
fscache_cookies_seq_show() also need to be wrapped with "#ifdef
CONFIG_PROC_F" ...

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

