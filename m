Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B92DA471203
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Dec 2021 06:45:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-wMS2X3ukMyGx3JavY3gN_A-1; Sat, 11 Dec 2021 00:45:04 -0500
X-MC-Unique: wMS2X3ukMyGx3JavY3gN_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80E581CCB4;
	Sat, 11 Dec 2021 05:45:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D887AB41;
	Sat, 11 Dec 2021 05:45:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 379FE1809C88;
	Sat, 11 Dec 2021 05:45:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BB5iwJR016327 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 11 Dec 2021 00:44:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A16540CFD11; Sat, 11 Dec 2021 05:44:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 156FF40CFD05
	for <linux-cachefs@redhat.com>; Sat, 11 Dec 2021 05:44:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF95729AA386
	for <linux-cachefs@redhat.com>; Sat, 11 Dec 2021 05:44:57 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-271-nat8xedMP8i0O37TDGjhNw-1; Sat, 11 Dec 2021 00:44:55 -0500
X-MC-Unique: nat8xedMP8i0O37TDGjhNw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R461e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-DNfxn_1639201487
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-DNfxn_1639201487) by smtp.aliyun-inc.com(127.0.0.1);
	Sat, 11 Dec 2021 13:44:48 +0800
Message-ID: <a95618c5-723d-bfaa-bf7a-48950be8d31d@linux.alibaba.com>
Date: Sat, 11 Dec 2021 13:44:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
From: JeffleXu <jefflexu@linux.alibaba.com>
To: David Howells <dhowells@redhat.com>
References: <20211210073619.21667-10-jefflexu@linux.alibaba.com>
	<20211210073619.21667-1-jefflexu@linux.alibaba.com>
	<292572.1639150908@warthog.procyon.org.uk>
	<fba8a28b-14c1-bf58-0578-32415c95f55d@linux.alibaba.com>
In-Reply-To: <fba8a28b-14c1-bf58-0578-32415c95f55d@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [RFC 09/19] netfs: refactor netfs_rreq_unlock()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/11/21 1:23 PM, JeffleXu wrote:
> 
> 
> On 12/10/21 11:41 PM, David Howells wrote:
>> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>>
>>> In demand-read case, the input folio of netfs API is may not the page
>>
>> "is may not the page"?  I think you're missing a verb (and you have too many
>> auxiliary verbs;-)
>>
> 
> Sorry for my poor English... What I want to express is that
> 
> "In demand-read case, the input folio of netfs API may not be the page
> cache inside the address space of the netfs file."
> 

By the way, can we change the current address_space based netfs API to
folio-based, which shall be more general? That is, the current
implementation of netfs API uses (address_space, page_offset, len) tuple
to describe the destination where the read data shall be store into.
While in the demand-read case, the input folio may not be the page
cache, and thus there's no address_space attached with it.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

