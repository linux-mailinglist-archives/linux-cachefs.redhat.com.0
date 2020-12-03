Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E72BF2CD54E
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 13:20:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-X2USSxjANumH3Q-aJEw4vw-1; Thu, 03 Dec 2020 07:20:54 -0500
X-MC-Unique: X2USSxjANumH3Q-aJEw4vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D44A8817BA3;
	Thu,  3 Dec 2020 12:20:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0BD10016FB;
	Thu,  3 Dec 2020 12:20:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29F7618095C7;
	Thu,  3 Dec 2020 12:20:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3CKhai001805 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 07:20:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 312BBD93D2; Thu,  3 Dec 2020 12:20:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B686D93D0
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 12:20:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD7A108C19A
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 12:20:39 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-302-JhK3FdHeMMSrUFZb5YHdyA-1;
	Thu, 03 Dec 2020 07:20:37 -0500
X-MC-Unique: JhK3FdHeMMSrUFZb5YHdyA-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id EF967866BA85;
	Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 885gxeYjaaLv; Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id C5CD88400B11;
	Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id B6710813EE05;
	Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id nTypsDlxzc6F; Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 8F4EC813EE2B;
	Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wmNepQXAIpL4; Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 77175813EE0E;
	Thu,  3 Dec 2020 12:20:35 +0000 (GMT)
Date: Thu, 3 Dec 2020 12:20:35 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
In-Reply-To: <932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: jRr/eG2N4Ts+gxyP7atxT3VAnkSniXilDtDp
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 25 Nov, 2020, at 17:14, Daire Byrne daire@dneg.com wrote:
> First off, writing direct to the originating server mount on the re-export
> server from userspace shows the ideal behaviour for all combinations:
> 
> originating server <- (vers=X,actimeo=1800,nconnect=X) <- reexport server
> writing = WRITE,WRITE .... repeating (good!)
> 
> Then re-exporting a NFSv4.2 server:
> 
> originating server <- (vers=4.2) <- reexport server - (vers=3) <- client writing
> = GETATTR,COMMIT,WRITE .... repeating
> originating server <- (vers=4.2) <- reexport server - (vers=4.2) <- client
> writing = GETATTR,WRITE .... repeating
> 
> And re-exporting a NFSv3 server:
> 
> originating server <- (vers=3) <- reexport server - (vers=4.2) <- client writing
> = WRITE,WRITE .... repeating (good!)
> originating server <- (vers=3) <- reexport server - (vers=3) <- client writing =
> WRITE,COMMIT .... repeating
>  
> So of all the combinations, a NFSv4.2 re-export of an NFSv3 server is the only
> one that matches the "ideal" case where we WRITE continuously without all the
> extra chatter.
> 
> And for completeness, taking that "good" case and making it bad with nconnect:
> 
> originating server <- (vers=3,nconnect=16) <- reexport server - (vers=4.2) <-
> client writing = WRITE,WRITE .... repeating (good!)
> originating server <- (vers=3) <- reexport server <- (vers=4.2,nconnect=16) <-
> client writing = WRITE,COMMIT,GETATTR .... randomly repeating
> 
> So using nconnect on the re-export's client causes lots more metadata ops. There
> are reasons for doing that for increasing throughput but it could be that the
> gain is offset by the extra metadata roundtrips.
> 
> Similarly, we have mostly been using a NFSv4.2 re-export of a NFSV4.2 server
> over the WAN because of reduced metadata ops for reading, but it looks like we
> incur extra metadata ops for writing.

Just a small update based on the most recent patchsets from Trond & Bruce:

https://patchwork.kernel.org/project/linux-nfs/list/?series=393567
https://patchwork.kernel.org/project/linux-nfs/list/?series=393561

For the write-through tests, the NFSv3 re-export of a NFSv4.2 server has trimmed an extra GETATTR:

Before:
originating server <- (vers=4.2) <- reexport server - (vers=3) <- client writing = WRITE,COMMIT,GETATTR .... repeating
 
After:
originating server <- (vers=4.2) <- reexport server - (vers=3) <- client writing = WRITE,COMMIT .... repeating

I'm assuming this is specifically due to the "EXPORT_OP_NOWCC" patch? All other combinations look the same as before (for write-through). An NFSv4.2 re-export of a NFSv3 server is still the best/ideal in terms of not incurring extra metadata roundtrips when writing.

It's great to see this re-export scenario becoming a better supported (and performing) topology; many thanks all.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

