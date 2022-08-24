Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B159F77E
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 12:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661336674;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Di7FefF3AjmdYMu/B4pBcp8ardkT3NIo3hBnUWo3Q8g=;
	b=M5kDJf5vD5TKwj5ZwoCkwLS2WjfNFy7iBFKgB/cqVI3K5IhA8tQ5X2rNkDCGi7hPjrTlC7
	V+FG94A3Hqqi5Qfj1BN7Q0SI5VIPMJuOCLwodSJ6VbBqRQgwV/7xK5jJ/jrI4iZaV5yJNH
	1AH1Uw8k8/4APvpm93cLpAF+MGL6STU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-Cvawt3nlPYqxf9t2X7QkTQ-1; Wed, 24 Aug 2022 06:24:34 -0400
X-MC-Unique: Cvawt3nlPYqxf9t2X7QkTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72F7C1C14B61;
	Wed, 24 Aug 2022 10:24:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 698D718ECC;
	Wed, 24 Aug 2022 10:24:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F6411946A52;
	Wed, 24 Aug 2022 10:24:33 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C60C91946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 10:24:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93F7F40D2831; Wed, 24 Aug 2022 10:24:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8737D400E726;
 Wed, 24 Aug 2022 10:24:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Yvy2LWrMMktWPAdk@B-P7TQMD6M-0146.local>
References: <Yvy2LWrMMktWPAdk@B-P7TQMD6M-0146.local>
 <20220817065200.11543-1-yinxin.x@bytedance.com>
 <YvyVOfzkITlvgtQ6@B-P7TQMD6M-0146.local>
 <CAK896s71E8a_iAYwEtzp7XKopQnVT5-YnkuC3yTewOfdmvf2VQ@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
MIME-Version: 1.0
Date: Wed, 24 Aug 2022 11:24:29 +0100
Message-ID: <3711027.1661336669@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: zhujia.zj@bytedance.com, Yongqing Li <liyongqing@bytedance.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3711026.1661336669.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Gao Xiang <hsiangkao@linux.alibaba.com> wrote:

> If David is fine with "req_id_next", I'm okay with that as well.

I can live with it.

Did you want to give me an R-b line?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

