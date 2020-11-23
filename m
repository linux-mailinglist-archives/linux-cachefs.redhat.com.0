Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 502DC2C153B
	for <lists+linux-cachefs@lfdr.de>; Mon, 23 Nov 2020 21:08:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-y6uSuLjEMLSwQXKj-PtzxQ-1; Mon, 23 Nov 2020 15:08:30 -0500
X-MC-Unique: y6uSuLjEMLSwQXKj-PtzxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C111410066FC;
	Mon, 23 Nov 2020 20:08:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5009F60864;
	Mon, 23 Nov 2020 20:08:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01D8A1809C9F;
	Mon, 23 Nov 2020 20:08:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANK87gC018259 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 15:08:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AAA1B9D63; Mon, 23 Nov 2020 20:08:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3AAE6D69F
	for <linux-cachefs@redhat.com>; Mon, 23 Nov 2020 20:08:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FC97811E76
	for <linux-cachefs@redhat.com>; Mon, 23 Nov 2020 20:08:05 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-271-MlHH-V5QM9yPV7zmzdU5Ig-1;
	Mon, 23 Nov 2020 15:08:00 -0500
X-MC-Unique: MlHH-V5QM9yPV7zmzdU5Ig-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id D9AAE1D992F6;
	Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ia1mRjTacRYp; Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id BDDF31D992F4;
	Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id ACA5882132F5;
	Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8GuFKPXSpPoc; Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 9063282132ED;
	Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1m4ohGwS5LnW; Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 6DDAB82132E8;
	Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
Date: Mon, 23 Nov 2020 20:07:58 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <279437663.92157874.1606162078305.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201122030339.GF3476@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<20201120223831.GB7705@fieldses.org>
	<20201120224438.GC7705@fieldses.org>
	<5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
	<1758069641.91412432.1605995069116.JavaMail.zimbra@dneg.com>
	<20201122000216.GE3476@fieldses.org>
	<1480128642.91427046.1606010150674.JavaMail.zimbra@dneg.com>
	<20201122030339.GF3476@fieldses.org>
MIME-Version: 1.0
Thread-Topic: nfsd: pre/post attr is using wrong change attribute
Thread-Index: 7Dz02UZgM2RrjuJC1N5frq3V8NVryg==
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
Cc: "J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 2/4] nfsd: pre/post attr is using wrong
	change attribute
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

----- On 22 Nov, 2020, at 03:03, bfields bfields@fieldses.org wrote:
>> The workload I have been looking at recently is a NFSv3 re-export of a NFSv4.2
>> mount. I can also say that it is generally when new files are being written to
>> a directory. So yes, the files and dir are changing at the time but I still
>> didn't expect to see so many repeated getattr neatly bundled together in short
>> bursts, e.g. (re-export server = 10.156.12.1, originating server 10.21.22.117).
> 
> Well, I guess the pre/post-op attributes could contribute to the
> problem, in that they could unnecessarily turn a COMMIT into
> 
>	GETATTR
>	COMMIT
>	GETATTR
> 
> And ditto for anything that modifies file or directory contents.  But
> I'd've thought some of those could have been cached.  Also it looks like
> you've got more GETATTRs than that.  Hm.

Yea, I definitely see those COMMITs surrounded by GETTATTRs with NFSv4.2... But as you say, I get way more repeat GETATTRs for the same filehandles.

I switched to a NFSv4.2 re-export of a NFSv3 server and saw the kind of thing - sometimes the wire would see 4-5 GETTATRs for the same FH in tight sequence with nothing in between. So then I started thinking.... how does nconnect work again? Because my re-export server is mounting the originating server with nconnect=16 and the flurries of repeat GETATTRs often contain a count in that ballpark.

I need to re-test without nconnect... Maybe that's how it's supposed to work and I'm just being over sensitive after this iversion issue.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

