Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44DC72B50ED
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 20:22:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-7mgNJxm1MPuf6dbs3seUKw-1; Mon, 16 Nov 2020 14:22:04 -0500
X-MC-Unique: 7mgNJxm1MPuf6dbs3seUKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6E3A57062;
	Mon, 16 Nov 2020 19:22:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7AD5C1CF;
	Mon, 16 Nov 2020 19:22:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B373558121;
	Mon, 16 Nov 2020 19:22:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGJLwYO018102 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 14:21:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DB28219CC97; Mon, 16 Nov 2020 19:21:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D16219CC95
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 19:21:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D7D5101CC6F
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 19:21:56 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-563-IgoNC5wYMUS9674mIMEjAA-1;
	Mon, 16 Nov 2020 14:21:53 -0500
X-MC-Unique: IgoNC5wYMUS9674mIMEjAA-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 8B5537E12CF8;
	Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sLdL-rdGJHSw; Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 6FD6E7E12CE7;
	Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 60D158150D4F;
	Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Qn-EqBm74RJx; Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 469B88150D5F;
	Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X_ohQm0wFXkB; Mon, 16 Nov 2020 19:21:51 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id EF4F2814E1B7;
	Mon, 16 Nov 2020 19:21:47 +0000 (GMT)
Date: Mon, 16 Nov 2020 19:21:47 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <1688437957.87985749.1605554507783.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201116155329.GE898@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<217712894.87456370.1605358643862.JavaMail.zimbra@dneg.com>
	<20201116155329.GE898@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: 8LqwOtJALJh7qY93Jll76WzyFc0fTw==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 16 Nov, 2020, at 15:53, bfields bfields@fieldses.org wrote:
> On Sat, Nov 14, 2020 at 12:57:24PM +0000, Daire Byrne wrote:
>> Now if anyone has any ideas why all the read calls to the originating
>> server are limited to a maximum of 128k (with rsize=1M) when coming
>> via the re-export server's nfsd threads, I see that as the next
>> biggest performance issue. Reading directly on the re-export server
>> with a userspace process issues 1MB reads as expected. It doesn't
>> happen for writes (wsize=1MB all the way through) but I'm not sure if
>> that has more to do with async and write back caching helping to build
>> up the size before commit?
> 
> I'm not sure where to start with this one....
> 
> Is this behavior independent of protocol version and backend server?

It seems to the case for all combinations of backend versions and re-export versions.

But it does look like it is related to readahead somehow. The default for a client mount is 128k ....

I just increased it to 1024 on the client mount of the originating server on the re-export server and now it's doing the expected 1MB (rsize) read requests back to onprem from the clients all the way through. i.e.

echo 1024 > /sys/class/bdi/0:52/read_ahead_kb

So, there is a difference in behaviour when reading from the client mount with user space processes or the knfsd threads on the re-export server.

Daire


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

