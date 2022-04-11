Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED04FBD7C
	for <lists+linux-cachefs@lfdr.de>; Mon, 11 Apr 2022 15:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649684562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3fe8Axhps8UkQO7+h1bHWPVj/ax6x97obYae6ZEoZDs=;
	b=bIbTczauz/bkfJk68Dx/nptSL9RTiueX+rUOhI1gudI5VJYyvB5cMz7KqJwGI8ydhhphAL
	dykaEtWIY4VeMMv/wXBMEL+W4YwZhMM2+i+kcJTJ66rIoTZ1eqTKF9s4SYxYwegF2BCuZ/
	KRNbo1yfqlECMikgxMHpuKTCMo7l10U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-vspxx0U2NSOQufeCkq93Ew-1; Mon, 11 Apr 2022 09:42:39 -0400
X-MC-Unique: vspxx0U2NSOQufeCkq93Ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C7C585A5A8;
	Mon, 11 Apr 2022 13:42:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 028FC404E4A2;
	Mon, 11 Apr 2022 13:42:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B5B291947BBB;
	Mon, 11 Apr 2022 13:42:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 33F0619466DF for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 11 Apr 2022 13:42:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1591B492D4C; Mon, 11 Apr 2022 13:42:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3071492D42;
 Mon, 11 Apr 2022 13:42:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <542f749c-b0f1-1de6-cb41-26e296afb2df@linux.alibaba.com>
References: <542f749c-b0f1-1de6-cb41-26e296afb2df@linux.alibaba.com>
 <20220406075612.60298-5-jefflexu@linux.alibaba.com>
 <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <1091405.1649680508@warthog.procyon.org.uk>
To: JeffleXu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Mon, 11 Apr 2022 14:42:34 +0100
Message-ID: <1094493.1649684554@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v8 04/20] cachefiles: notify user daemon
 when withdrawing cookie
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
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
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
Content-ID: <1094492.1649684554.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

JeffleXu <jefflexu@linux.alibaba.com> wrote:

> > 
> >> +	if (fd == 0)
> >> +		return -ENOENT;
> > 
> > 0 is a valid fd.
> 
> Yeah, but IMHO fd 0 is always for stdin? I think the allocated anon_fd
> won't install at fd 0. Please correct me if I'm wrong.

If someone has closed 0, then you'll get 0 next, I'm pretty sure.  Try it and
see.

> In fact I wanna use "fd == 0" as the initial state as struct
> cachefiles_object is allocated with kmem_cache_zalloc().

I would suggest presetting it to something like -2 to avoid confusion.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

