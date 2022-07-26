Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E190B5808E2
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jul 2022 03:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658797580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KgwF2RRX0z1CcLN3v//fHZvtHKlRUeX/mlMn0EiwtvA=;
	b=NncGoYditk0JijcuCsU/feop/Sezgutsvmj85qKQpE/M8UoJs/abFQgyneASvfjc9yYuX8
	VDnRjqIGj6dYg3FLix9wQU0WWV1oLh4LiuuGa7/zsFNYSw+xUKTPZ/k1nF7iMMjdHf3l+o
	SZ66JbRQQdVF6aCZP4/CrlWoEFuVq2s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-YWr-E4oQMi-n-x2U3Gxp9A-1; Mon, 25 Jul 2022 21:06:17 -0400
X-MC-Unique: YWr-E4oQMi-n-x2U3Gxp9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B75F038041CB;
	Tue, 26 Jul 2022 01:06:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B284D492C3B;
	Tue, 26 Jul 2022 01:06:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E5801945D8B;
	Tue, 26 Jul 2022 01:06:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 882161945D86 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 26 Jul 2022 01:06:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 74CC240CFD0A; Tue, 26 Jul 2022 01:06:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7117040CFD05
 for <linux-cachefs@redhat.com>; Tue, 26 Jul 2022 01:06:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5968085A581
 for <linux-cachefs@redhat.com>; Tue, 26 Jul 2022 01:06:14 +0000 (UTC)
Received: from m1364.mail.163.com (m1364.mail.163.com [220.181.13.64]) by
 relay.mimecast.com with ESMTP id us-mta-438-cxbGCNXOOYW2opb5PiZMow-1; Mon,
 25 Jul 2022 21:06:08 -0400
X-MC-Unique: cxbGCNXOOYW2opb5PiZMow-1
Received: from slark_xiao$163.com ( [223.104.68.106] ) by
 ajax-webmail-wmsvr64 (Coremail) ; Tue, 26 Jul 2022 09:04:41 +0800 (CST)
X-Originating-IP: [223.104.68.106]
Date: Tue, 26 Jul 2022 09:04:41 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Baoquan He" <bhe@redhat.com>
X-Priority: 3
In-Reply-To: <Yt6bVIoRa0nIvxei@MiWiFi-R3L-srv>
References: <YtlyDZEsOZHt6tRs@MiWiFi-R3L-srv>
 <20220721015605.20651-1-slark_xiao@163.com>
 <2778505.1658746506@warthog.procyon.org.uk>
 <Yt6bVIoRa0nIvxei@MiWiFi-R3L-srv>
MIME-Version: 1.0
Message-ID: <55d366e4.486.1823808de32.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMGowAD3Ei+pPd9i1g8sAA--.42687W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCdRZJZGBbEenN+gACs4
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v2] docs: Fix typo in comment
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
Cc: linux-cachefs@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 bigeasy@linutronix.de, ast@kernel.org, song@kernel.org, sdf@google.com,
 will@kernel.org, daniel@iogearbox.net, corbet@lwn.net, william.gray@linaro.org,
 john.fastabend@gmail.com, andrii@kernel.org, mingo@redhat.com,
 longman@redhat.com, dyoung@redhat.com, vgoyal@redhat.com, boqun.feng@gmail.com,
 kpsingh@kernel.org, yhs@fb.com, tglx@linutronix.de, haoluo@google.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

















At 2022-07-25 21:32:04, "Baoquan He" <bhe@redhat.com> wrote:
>On 07/25/22 at 11:55am, David Howells wrote:
>> Baoquan He <bhe@redhat.com> wrote:
>> 
>> > sed -i "s/the the /the /g" `git grep -l "the the "`
>> 
>> You might want to clarify the first "the" with a preceding boundary marker.
>> There are some English words ending in "the" that can be used as verbs, though
>> I'm not sure you'd find any of them here - clothe for example.
>
>Right. I plan to split this big one into patches corresponding to
>different component as Jonathan suggested, and will consider how to mark
>the first 'the' as you suggested, and wrap Slark's pathces which
>includes typo fix of "then the".
>
>Thanks
>Baoquan

Actually I have committed all changes which were listed in your previous list.
I committed it one by one and checked if any other typo is included.
If possible, you can try other double typo issue like "and and " or "or or" or something else.


Thanks
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

