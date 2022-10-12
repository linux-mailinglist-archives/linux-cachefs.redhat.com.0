Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F55FC17E
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Oct 2022 09:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665561211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3c+7vIRwXIxa3iR77ub4zu1ICCxeIJTZlDJWoUSCdu4=;
	b=e5X0tufEjqHXMub+4EOjuCujvr0+3aGG5w3um2v/3OzcKDM/Mog7JwuG/B+84uQ14Cqbsc
	Ix1Plke+wIPVTl0Fa91oOsT78l4CIOVzVYLgpWD8FVL6rBt57Rned/gCVTiKX2xvNa0a0X
	G36EtMO/EJz0/jE7YfhGHZtMYi1j6UQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-gwOnsxttMHK0f5iemeNNIg-1; Wed, 12 Oct 2022 03:53:28 -0400
X-MC-Unique: gwOnsxttMHK0f5iemeNNIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C6773C0F223;
	Wed, 12 Oct 2022 07:53:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEDB8112D402;
	Wed, 12 Oct 2022 07:53:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 68D8D19465A0;
	Wed, 12 Oct 2022 07:53:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B9D31946589 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 07:53:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF4264EA47; Wed, 12 Oct 2022 07:53:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D80624EA4A
 for <linux-cachefs@redhat.com>; Wed, 12 Oct 2022 07:53:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B62D029ABA3E
 for <linux-cachefs@redhat.com>; Wed, 12 Oct 2022 07:53:21 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-365-iZPw-I9sOuOHXgWFOD9Z0w-1; Wed, 12 Oct 2022 03:53:19 -0400
X-MC-Unique: iZPw-I9sOuOHXgWFOD9Z0w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VS-qA-q_1665561193
Received: from 30.221.128.220(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VS-qA-q_1665561193) by smtp.aliyun-inc.com;
 Wed, 12 Oct 2022 15:53:14 +0800
Message-ID: <28d64f00-e408-9fc2-9506-63c1d8b08b9c@linux.alibaba.com>
Date: Wed, 12 Oct 2022 15:53:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20221011131552.23833-1-zhujia.zj@bytedance.com>
 <20221011131552.23833-4-zhujia.zj@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20221011131552.23833-4-zhujia.zj@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH 3/5] cachefiles: resend an open request
 if the read request's object is closed
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 10/11/22 9:15 PM, Jia Zhu wrote:
> @@ -254,12 +282,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  	 * request distribution fair.
>  	 */
>  	xa_lock(&cache->reqs);
> -	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
> -	if (!req && cache->req_id_next > 0) {
> -		xas_set(&xas, 0);
> -		req = xas_find_marked(&xas, cache->req_id_next - 1, CACHEFILES_REQ_NEW);
> +retry:
> +	xas_for_each_marked(&xas, req, xa_max, CACHEFILES_REQ_NEW) {
> +		if (cachefiles_ondemand_skip_req(req))
> +			continue;
> +		break;
>  	}
>  	if (!req) {
> +		if (cache->req_id_next > 0 && xa_max == ULONG_MAX) {
> +			xas_set(&xas, 0);
> +			xa_max = cache->req_id_next - 1;
> +			goto retry;
> +		}

I would suggest abstracting the "xas_for_each_marked(...,
CACHEFILES_REQ_NEW)" part into a helper function to avoid the "goto retry".


> @@ -392,8 +434,16 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
>  	wake_up_all(&cache->daemon_pollwq);
>  	wait_for_completion(&req->done);
>  	ret = req->error;
> +	kfree(req);
> +	return ret;
>  out:
>  	kfree(req);
> +	/* Reset the object to close state in error handling path.
> +	 * If error occurs after creating the anonymous fd,
> +	 * cachefiles_ondemand_fd_release() will set object to close.
> +	 */
> +	if (opcode == CACHEFILES_OP_OPEN)
> +		cachefiles_ondemand_set_object_close(req->object);

This may cause use-after-free since @req has been freed.



-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

