Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AE6CC1ED
	for <lists+linux-cachefs@lfdr.de>; Tue, 28 Mar 2023 16:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680013163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZumitIarYwmdrLlu5kijHyLiGTnyWpHppQzJ6PKN3Gk=;
	b=FgK14GqAK9bskmtBVg8qMcJfrnqKWWyNv7AaO5BBkBkJ3yAzVbhuRTUh5lWMMcnOUuqa/M
	lgWD1g78nZYiCTjfTLXwlbE6eqQkju0+ksypdwKlID3//e41O1PFFRxsHj2RMb3s4kkODe
	Lqs3kJYWkL5veYasXH6CPO8eycbqHZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-_lbNboDyPqCFjBT8wpUJnQ-1; Tue, 28 Mar 2023 10:19:20 -0400
X-MC-Unique: _lbNboDyPqCFjBT8wpUJnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D88FA85C074;
	Tue, 28 Mar 2023 14:19:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE7A84020C83;
	Tue, 28 Mar 2023 14:19:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 92274194658F;
	Tue, 28 Mar 2023 14:19:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14A5F1946589 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 28 Mar 2023 14:19:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A33241121331; Tue, 28 Mar 2023 14:19:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD891121330;
 Tue, 28 Mar 2023 14:19:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230111052515.53941-5-zhujia.zj@bytedance.com>
References: <20230111052515.53941-5-zhujia.zj@bytedance.com>
 <20230111052515.53941-1-zhujia.zj@bytedance.com>
To: Jia Zhu <zhujia.zj@bytedance.com>
MIME-Version: 1.0
Date: Tue, 28 Mar 2023 15:19:05 +0100
Message-ID: <133078.1680013145@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH V4 4/5] cachefiles: narrow the scope of
 triggering EPOLLIN events in ondemand mode
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <133077.1680013145.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jia Zhu <zhujia.zj@bytedance.com> wrote:

> +		if (!xa_empty(xa)) {
> +			xa_lock(xa);
> +			xa_for_each_marked(xa, index, req, CACHEFILES_REQ_NEW) {
> +				if (!cachefiles_ondemand_is_reopening_read(req)) {
> +					mask |= EPOLLIN;
> +					break;
> +				}
> +			}
> +			xa_unlock(xa);
> +		}

I wonder if there's a more efficient way to do this.  I guess it depends on
how many reqs you expect to get in a queue.  It might be worth taking the
rcu_read_lock before calling xa_lock() and holding it over the whole loop.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

