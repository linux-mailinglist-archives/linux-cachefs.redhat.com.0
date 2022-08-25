Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D35A13B0
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 16:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661438082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yA/n6hNI9P04CJLrKuRZa1Hsz3unH4eBgaNUO5Y18FA=;
	b=Cm9VdFDrUTFGRJf/k2PvaRRmzPyD3pHvgmzMkto0vu/eddE8p41jnvOWQqJhDQs4AOdngF
	SB6lcktgmfIqrZdd+9VvLff7hljAvmazI+WfzUudsaiUnE6QFeQ8z0QqA84pjbG6Jk7d1w
	QyhQuGPaXKiwjVnjcfm6KMQWswu2YhM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-0m6Vo4cJMLOLywx7kqlnxw-1; Thu, 25 Aug 2022 10:34:39 -0400
X-MC-Unique: 0m6Vo4cJMLOLywx7kqlnxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B2E11C14D32;
	Thu, 25 Aug 2022 14:34:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22402C15BB3;
	Thu, 25 Aug 2022 14:34:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC4171946A5E;
	Thu, 25 Aug 2022 14:34:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B92631946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 14:34:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 972CF492C3B; Thu, 25 Aug 2022 14:34:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3529403349;
 Thu, 25 Aug 2022 14:34:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAK896s4uuU=K5Gau9J79GK_pWQuihyfXUoZCq0iFbWt9fHLudQ@mail.gmail.com>
References: <CAK896s4uuU=K5Gau9J79GK_pWQuihyfXUoZCq0iFbWt9fHLudQ@mail.gmail.com>
 <20220817065200.11543-1-yinxin.x@bytedance.com>
 <3713582.1661336736@warthog.procyon.org.uk>
To: Xin Yin <yinxin.x@bytedance.com>
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 15:34:36 +0100
Message-ID: <3791693.1661438076@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [External] Re: [PATCH] cachefiles: make
 on-demand request distribution fairer
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
Cc: Yongqing Li <liyongqing@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3791692.1661438076.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xin Yin <yinxin.x@bytedance.com> wrote:

> > Can you give me a Fixes: line please?
> >
> Sure , I will send a V2 patch and add the Fixes line.

Just giving me a Fixes line would do.  I can insert it.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

