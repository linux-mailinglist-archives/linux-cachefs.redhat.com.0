Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00E62DCCF
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 14:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668691849;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iNsA2sVm3eCMGbRDAn5Y27k8TwZRDdw761puYCvcSx4=;
	b=hDBKGFYR3LHoPihZ6ckZQ2LgBncTAPUSDstNjAPTNzyGl5vc7szXydwwzd7Rm4URVhj6Ey
	Px0OgO0gtNh+U+FQAskKXKIrDq+YsxMqgLaKG0fyADU+1iAtJ8r/cWUyhYFfpojuX8JYsd
	T06tiI0hxn70HJh8KwGZpckGEuZ/D9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502--QgScpo1MOeQLu1cNcYltg-1; Thu, 17 Nov 2022 08:30:46 -0500
X-MC-Unique: -QgScpo1MOeQLu1cNcYltg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB9E2882822;
	Thu, 17 Nov 2022 13:30:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C697D1415119;
	Thu, 17 Nov 2022 13:30:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5C8AB19465A8;
	Thu, 17 Nov 2022 13:30:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 591E619465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 13:30:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F26840C95E3; Thu, 17 Nov 2022 13:30:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E55F40C6EC3;
 Thu, 17 Nov 2022 13:30:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221117115023.1350181-2-dwysocha@redhat.com>
References: <20221117115023.1350181-2-dwysocha@redhat.com>
 <20221117115023.1350181-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Thu, 17 Nov 2022 13:30:37 +0000
Message-ID: <3715748.1668691837@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH 1/1] fscache: Fix oops due to race with
 cookie_lru and use_cookie
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3715747.1668691837.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Wysochanski <dwysocha@redhat.com> wrote:

> If a cookie expires from the LRU and the LRU_DISCARD flag is set,
> but the state machine has not run yet, it's possible another thread
> can call fscache_use_cookie and begin to use it.  When the
> cookie_worker finally runs, it will see the LRU_DISCARD flag set,
> transition the cookie->state to LRU_DISCARDING, which will then
> withdraw the cookie.  Once the cookie is withdrawn the object is
> removed the below oops will occur because the object associated
> with the cookie is now NULL.
> 
> Fix the oops by clearing the LRU_DISCARD bit if another thread
> uses the cookie before the cookie_worker runs.

I think this is the right approach.  The state machine should just fall
through without doing anything, despite having been woken.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

