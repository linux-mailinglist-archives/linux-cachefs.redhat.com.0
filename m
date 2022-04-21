Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E276250A160
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Apr 2022 15:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650549432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yDzlawIhhM/L1tr1yJ7QmVJryup9QsuuTjpxLesBIC0=;
	b=Yz2oEAHejz9lH+Sv9bVvgb/xGC/P4uwTV8pVuDgwqbMLIVwDXdk1j2JSvW3j06GrfF4ExI
	XU3Mg4YgO8JAUeZjge8HtVexrFcWSpxtbVlaocyT4DhWiN1V9M8h7MnN7e7mCIX3nRbQ4k
	HyZ2wQTDwfeEDVqUq8HAdJnLeWqDiTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-2_aNaQI8MPiNlJ-op_d81g-1; Thu, 21 Apr 2022 09:57:10 -0400
X-MC-Unique: 2_aNaQI8MPiNlJ-op_d81g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 594031C0BF31;
	Thu, 21 Apr 2022 13:57:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16FBA40FF40B;
	Thu, 21 Apr 2022 13:57:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AFAAF194034C;
	Thu, 21 Apr 2022 13:57:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E104619451EF for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Apr 2022 13:57:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE44F145B99C; Thu, 21 Apr 2022 13:57:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F2C145BA52;
 Thu, 21 Apr 2022 13:57:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220415123614.54024-3-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-3-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 14:57:03 +0100
Message-ID: <1444650.1650549423@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v9 02/21] cachefiles: notify user daemon
 when looking up cookie
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
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1444649.1650549423.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> +	help
> +	  This permits on-demand read mode of cachefiles.  In this mode, when
> +	  cache miss, the cachefiles backend instead of netfs, is responsible
> +	  for fetching data, e.g. through user daemon.

How about:

	help
	  This permits userspace to enable the cachefiles on-demand read mode.
	  In this mode, when a cache miss occurs, responsibility for fetching
	  the data lies with the cachefiles backend instead of with the netfs
	  and is delegated to userspace.

> +	/*
> +	 * 1) Cache has been marked as dead state, and then 2) flush all
> +	 * pending requests in @reqs xarray. The barrier inside set_bit()
> +	 * will ensure that above two ops won't be reordered.
> +	 */

What set_bit()?  What "above two ops"?  And that's not how barriers work; they
provide a partial ordering relative to another pair of barriered ops.

Also, set_bit() can't be relied upon to imply a barrier - see
Documentation/memory-barriers.txt.

> +	if (IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
> +	    test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags)) {

It might be worth abstracting this into an inline function in internal.h:

	static inline bool cachefiles_in_ondemand_mode(cache)
	{
		return IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
			test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags)
	}

> +#ifdef CONFIG_CACHEFILES_ONDEMAND

This looks like it ought to be superfluous, given the preceding test - though
I can see why you need it:

> +#ifdef CONFIG_CACHEFILES_ONDEMAND
> +	struct xarray			reqs;		/* xarray of pending on-demand requests */
> +	struct xarray			ondemand_ids;	/* xarray for ondemand_id allocation */
> +	u32				ondemand_id_next;
> +#endif

I'm tempted to say that you should just make them non-conditional.  It's not
like there's likely to be more than one or two cachefiles_cache structs on a
system.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

