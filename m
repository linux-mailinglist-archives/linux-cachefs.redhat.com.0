Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B65F8480
	for <lists+linux-cachefs@lfdr.de>; Sat,  8 Oct 2022 11:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665219942;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F2S9lL/f/QxOP79RRAf0w/4yPIR/B6kyuYRK9btHLAk=;
	b=M3d8MWRxBpyEUa+XcH363MQfJmUHtp7Hk5lSDVIjrOcp8AC4ynX2sfjxtOdmQ5174gmb9A
	IVC1+Dl7hRbu+szgGEJPb1094aT5Puc0duFMtffvPrt93S+8sVyLymSP4q5jFnCnozq1+H
	7eaXDa7aOQNY3lXTqUiIs6D04DulD4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-eJtS_AuSNV-J6ayl8-rIrA-1; Sat, 08 Oct 2022 05:05:40 -0400
X-MC-Unique: eJtS_AuSNV-J6ayl8-rIrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72D81811E81;
	Sat,  8 Oct 2022 09:05:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC1AC68E33;
	Sat,  8 Oct 2022 09:05:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B083A1946A51;
	Sat,  8 Oct 2022 09:05:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 210431946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  8 Oct 2022 09:05:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67D6D535D2B; Sat,  8 Oct 2022 09:05:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6021E535D28
 for <linux-cachefs@redhat.com>; Sat,  8 Oct 2022 09:05:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43B4E3C0257B
 for <linux-cachefs@redhat.com>; Sat,  8 Oct 2022 09:05:30 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-259-iFQkFXi8NyO8_zinSuyoxw-1; Sat, 08 Oct 2022 05:05:28 -0400
X-MC-Unique: iFQkFXi8NyO8_zinSuyoxw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VRcD6Ms_1665219618
Received: from 30.221.130.66(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VRcD6Ms_1665219618) by smtp.aliyun-inc.com;
 Sat, 08 Oct 2022 17:00:19 +0800
Message-ID: <514c06f7-017d-bca5-6a87-0dae54c0d83d@linux.alibaba.com>
Date: Sat, 8 Oct 2022 17:00:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20220818135204.49878-1-zhujia.zj@bytedance.com>
 <20220818135204.49878-6-zhujia.zj@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220818135204.49878-6-zhujia.zj@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [RFC PATCH 5/5] cachefiles: add restore command
 to recover inflight ondemand read requests
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/18/22 9:52 PM, Jia Zhu wrote:
> Previously, in ondemand read scenario, if the anonymous fd was closed by
> user daemon, inflight and subsequent read requests would return EIO.
> As long as the device connection is not released, user daemon can hold
> and restore inflight requests by setting the request flag to
> CACHEFILES_REQ_NEW.
> 
> Suggested-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
> Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> ---
>  fs/cachefiles/daemon.c   |  1 +
>  fs/cachefiles/internal.h |  3 +++
>  fs/cachefiles/ondemand.c | 23 +++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
> index c74bd1f4ecf5..014369266cb2 100644
> --- a/fs/cachefiles/daemon.c
> +++ b/fs/cachefiles/daemon.c
> @@ -77,6 +77,7 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
>  	{ "tag",	cachefiles_daemon_tag		},
>  #ifdef CONFIG_CACHEFILES_ONDEMAND
>  	{ "copen",	cachefiles_ondemand_copen	},
> +	{ "restore",	cachefiles_ondemand_restore	},
>  #endif
>  	{ "",		NULL				}
>  };
> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index b4af67f1cbd6..d504c61a5f03 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -303,6 +303,9 @@ extern ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
>  				     char *args);
>  
> +extern int cachefiles_ondemand_restore(struct cachefiles_cache *cache,
> +					char *args);
> +
>  extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
>  extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
>  
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index 79ffb19380cd..5b1c447da976 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -178,6 +178,29 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
>  	return ret;
>  }
>  
> +int cachefiles_ondemand_restore(struct cachefiles_cache *cache, char *args)
> +{
> +	struct cachefiles_req *req;
> +
> +	XA_STATE(xas, &cache->reqs, 0);
> +
> +	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
> +		return -EOPNOTSUPP;
> +
> +	/*
> +	 * Search the requests which being processed before
> +	 * the user daemon crashed.
> +	 * Set the CACHEFILES_REQ_NEW flag and user daemon will reprocess it.
> +	 */

The comment can be improved as:

	Reset the requests to CACHEFILES_REQ_NEW state, so that the
        requests have been processed halfway before the crash of the
        user daemon could be reprocessed after the recovery.


> +	xas_lock(&xas);
> +	xas_for_each(&xas, req, ULONG_MAX)
> +		xas_set_mark(&xas, CACHEFILES_REQ_NEW);
> +	xas_unlock(&xas);
> +
> +	wake_up_all(&cache->daemon_pollwq);
> +	return 0;
> +}
> +
>  static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
>  {
>  	struct cachefiles_object *object;

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

