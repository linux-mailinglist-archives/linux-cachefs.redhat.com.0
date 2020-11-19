Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55CCF2B98FF
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 Nov 2020 18:12:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-K8sAJLPOP_qwULvMt4DA6w-1; Thu, 19 Nov 2020 12:12:35 -0500
X-MC-Unique: K8sAJLPOP_qwULvMt4DA6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4140A107ACFB;
	Thu, 19 Nov 2020 17:12:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5206A60636;
	Thu, 19 Nov 2020 17:12:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5D7E1809CA0;
	Thu, 19 Nov 2020 17:12:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJHCRXF010721 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 12:12:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 358232026D5D; Thu, 19 Nov 2020 17:12:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30C162026D47
	for <linux-cachefs@redhat.com>; Thu, 19 Nov 2020 17:12:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D43538007D9
	for <linux-cachefs@redhat.com>; Thu, 19 Nov 2020 17:12:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-BvI3pIqGOm-LO93ugR5Q9Q-1; Thu, 19 Nov 2020 12:12:22 -0500
X-MC-Unique: BvI3pIqGOm-LO93ugR5Q9Q-1
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=noisy.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfmsC-0006tp-TE; Thu, 19 Nov 2020 16:33:29 +0000
Received: from hirez.programming.kicks-ass.net
	(hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AF6713011C6;
	Thu, 19 Nov 2020 17:33:27 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9AF002C36A0D3; Thu, 19 Nov 2020 17:33:27 +0100 (CET)
Date: Thu, 19 Nov 2020 17:33:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20201119163327.GT3121392@hirez.programming.kicks-ass.net>
References: <2220347.1605801222@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2220347.1605801222@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, willy@infradead.org, paulmck@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] Can you help diagnose a weird failed wake?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2020 at 03:53:42PM +0000, David Howells wrote:

> 		timeo = wait_var_event_timeout(&cookie->stage, cookie_stage_changed(cookie, stage), 10*HZ);

> 			cookie->stage = stage;                                                              
> 			changed = true;                                                                    
> 			break;                                                                              
> 		}                                                                                          
> 		spin_unlock(&cookie->lock);                                                                
> 		if (changed) {                                                                              

smp_mb(); // see comment on wake_up_bit() / wakequeue_active()

> 			wake_up_var(&cookie->stage);                                                        


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

