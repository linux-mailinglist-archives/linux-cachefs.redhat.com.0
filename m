Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E23FA6E24CB
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 15:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681480411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BpS6/rjfPfmQ6oj750SQLHKtiFZ9lurM5JK5Tshx+FY=;
	b=IT4Sp3OtWaC9XwBFiNkQ3htBHTuaUL3INOnCOYdBQozZes5U4lS7pBTqnF7ormq8pVp+W/
	sftvFAyhTDhabnXDNO2FNnuV9jl6FbfvTjtfcG8YtLuSh01dIKWGv0FKJKYoxKXT02JdEX
	rkkoQHuFazPWDkgv9CFugQTly0qX67I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-w5xS9QHpPzGERd3gnfLMsQ-1; Fri, 14 Apr 2023 09:53:28 -0400
X-MC-Unique: w5xS9QHpPzGERd3gnfLMsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79220282381A;
	Fri, 14 Apr 2023 13:53:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70031404DC43;
	Fri, 14 Apr 2023 13:53:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FB2519472C4;
	Fri, 14 Apr 2023 13:53:27 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9E7FA1946A7F for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 13:53:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DE322027046; Fri, 14 Apr 2023 13:53:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6492027044;
 Fri, 14 Apr 2023 13:53:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230329140155.53272-6-zhujia.zj@bytedance.com>
References: <20230329140155.53272-6-zhujia.zj@bytedance.com>
 <20230329140155.53272-1-zhujia.zj@bytedance.com>
To: Jia Zhu <zhujia.zj@bytedance.com>
MIME-Version: 1.0
Date: Fri, 14 Apr 2023 14:53:24 +0100
Message-ID: <1250439.1681480404@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH V5 5/5] cachefiles: add restore command
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
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1250438.1681480404.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jia Zhu <zhujia.zj@bytedance.com> wrote:

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
> +	 * Reset the requests to CACHEFILES_REQ_NEW state, so that the
> +	 * requests have been processed halfway before the crash of the
> +	 * user daemon could be reprocessed after the recovery.
> +	 */
> +	xas_lock(&xas);
> +	xas_for_each(&xas, req, ULONG_MAX)
> +		xas_set_mark(&xas, CACHEFILES_REQ_NEW);
> +	xas_unlock(&xas);
> +
> +	wake_up_all(&cache->daemon_pollwq);
> +	return 0;
> +}

Should there be a check to see if this is needed?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

