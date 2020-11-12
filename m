Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50B852B0CB2
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Nov 2020 19:34:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-ThsL3zOqMxy1Rg5LqZC9Hg-1; Thu, 12 Nov 2020 13:34:10 -0500
X-MC-Unique: ThsL3zOqMxy1Rg5LqZC9Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4481A809DF2;
	Thu, 12 Nov 2020 18:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 926E55D9E4;
	Thu, 12 Nov 2020 18:34:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A441B58103;
	Thu, 12 Nov 2020 18:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACIY0eN016920 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 13:34:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A82A202450E; Thu, 12 Nov 2020 18:34:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0586B2011577
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 18:33:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99238102F1E4
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 18:33:56 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-508-SmMiRdKINwadKLTaiNfO0g-1;
	Thu, 12 Nov 2020 13:33:47 -0500
X-MC-Unique: SmMiRdKINwadKLTaiNfO0g-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id D58DE6B6E303;
	Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ki2VSpan4u8R; Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id B3A106B3B65B;
	Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id A35868156A16;
	Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xChTnRKdZWYi; Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 848FB8154F70;
	Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aw3arRsvUCfv; Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 6A9888156A16;
	Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
Date: Thu, 12 Nov 2020 18:33:45 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201112135733.GA9243@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: Tx3z7h88VbP/wqegmXaDTPRSGXosjg==
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 12 Nov, 2020, at 13:57, bfields bfields@fieldses.org wrote:
> On Thu, Nov 12, 2020 at 01:01:24PM +0000, Daire Byrne wrote:
>> 
>> Having just completed a bunch of fresh cloud rendering with v5.9.1 and Trond's
>> NFSv3 lookupp emulation patches, I can now revise my original list of issues
>> that others will likely experience if they ever try to do this craziness:
>> 
>> 1) Don't re-export NFSv4.0 unless you set vfs_cache_presure=0 otherwise you will
>> see random input/output errors on your clients when things are dropped out of
>> the cache. In the end we gave up on using NFSv4.0 with our Netapps because the
>> 7-mode implementation seemed a bit flakey with modern Linux clients (Linux
>> NFSv4.2 servers on the other hand have been rock solid). We now use NFSv3 with
>> Trond's lookupp emulation patches instead.
> 
> So,
> 
>		NFSv4.2			  NFSv4.2
>	client --------> re-export server -------> original server
> 
> works as long as both servers are recent Linux, but when the original
> server is Netapp, you need the protocol used in both places to be v3, is
> that right?

Well, yes NFSv4.2 all the way through works well for us but it's re-exporting a NFSv4.0 server (Linux OR Netapp) that seems to still show the input/output errors when dropping caches. Every other possible combination now seems to be working without ESTALE or input/errors with the lookupp emulation patches.

So this is still not working when dropping caches on the re-export server:

		NFSv3/4.x			  NFSv4.0
	client --------> re-export server -------> original server

The bit specific to the Netapp is simply that our 7-mode only supports NFSv4.0 so I can't actually test NFSv4.1/4.2 on a more modern Netapp firmware release. So I have to use NFSv3 to mount the Netapp and can then happily re-export that using NFSv4.x or NFSv3 (if the filehandles fit in 63 bytes).

>> 2) In order to better utilise the re-export server's client cache when
>> re-exporting an NFSv3 server (using either NFSv3 or NFSv4), we still need to
>> use the horrible inode_peek_iversion_raw hack to maintain good metadata
>> performance for large numbers of clients. Otherwise each re-export server's
>> clients can cause invalidation of the re-export server client cache. Once you
>> have hundreds of clients they all combine to constantly invalidate the cache
>> resulting in an order of magnitude slower metadata performance. If you are
>> re-exporting an NFSv4.x server (with either NFSv3 or NFSv4.x) this hack is not
>> required.
> 
> Have we figured out why that's required, or found a longer-term
> solution?  (Apologies, the memory of the earlier conversation is
> fading....)

There was some discussion about NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR allowing for the hack/optimisation but I guess that is only for the case when re-exporting NFSv4 to the eventual clients. It would not help if you were re-exporting an NFSv3 server with NFSv3 to the clients? I lack the deeper understanding to say anything more than that.

In our case we re-export everything to the clients using NFSv4.2 whether the originating server is NFSv3 (e.g our Netapp) or NFSv4.2 (our RHEL7 storage servers).

With NFSv4.2 as the originating server, we found that either this hack/optimsation was not required or the incidence rate of invalidating the re-export server's client cache was much less as to not cause significant performance problems when many clients requested the same metadata.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

