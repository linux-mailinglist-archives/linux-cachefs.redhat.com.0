Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1247E78C
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 19:15:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-sKAZK4mpM1O3Q-WAbrp5dQ-1; Thu, 23 Dec 2021 13:15:22 -0500
X-MC-Unique: sKAZK4mpM1O3Q-WAbrp5dQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEB5B1006AA0;
	Thu, 23 Dec 2021 18:15:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 705A54E2B3;
	Thu, 23 Dec 2021 18:15:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F3E44BB7B;
	Thu, 23 Dec 2021 18:15:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BNIFE7o009699 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 23 Dec 2021 13:15:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 927A451599C; Thu, 23 Dec 2021 18:15:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EE6551598A
	for <linux-cachefs@redhat.com>; Thu, 23 Dec 2021 18:15:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75A3C811E76
	for <linux-cachefs@redhat.com>; Thu, 23 Dec 2021 18:15:14 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-119-JUOEA3-gNlu1yzMqhiY_-Q-1; Thu, 23 Dec 2021 13:15:12 -0500
X-MC-Unique: JUOEA3-gNlu1yzMqhiY_-Q-1
Date: Thu, 23 Dec 2021 19:15:09 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <YcS8rc64cVIckeW0@linutronix.de>
References: <20211223163500.2625491-1-bigeasy@linutronix.de>
	<901885.1640279829@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <901885.1640279829@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: Gregor Beck <gregor.beck@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH REPOST REPOST v2] fscache: Use only one
 fscache_object_cong_wait.
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-12-23 17:17:09 [+0000], David Howells wrote:
> Thanks, but this is gone in the upcoming fscache rewrite.  I'm hoping that
> will get in the next merge window.

Yes, I noticed that. What about current tree, v5.16-rc6 and less?
Shouldn't this be addressed?

> David

Sebastian

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

