Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A0580806
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jul 2022 01:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658790793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DjP6Kf8HrgrAfbWIiGaRoFMYPslzDgQOXWfll5/8Sok=;
	b=bL0UzGwNgbm1DmgiUYNTPLw4SJdudKZSIMCPnrEZwjCdzVrXVT1Xf30zuc6+3+Kps1xwZK
	12aLQa8pBpl8fuiSbNWFQ3E5rYQBwaxAUPoL0WlxI/PTARmzAJU+ReqmFXugij36/5Dy5q
	EIrM+qdw4ZUpCiUEGap7yjKFl3hOgf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-ZIC1ZBYVNleb2jO1qmJrOQ-1; Mon, 25 Jul 2022 19:13:10 -0400
X-MC-Unique: ZIC1ZBYVNleb2jO1qmJrOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D518001EA;
	Mon, 25 Jul 2022 23:13:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 736042026D64;
	Mon, 25 Jul 2022 23:13:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C8871945D8A;
	Mon, 25 Jul 2022 23:13:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A98971945D86 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 23:13:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 90864492CA4; Mon, 25 Jul 2022 23:13:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C821492CA2
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 23:13:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EFE83C0D84A
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 23:13:06 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-qSqZIlXWMRyXRcZgp68Sbg-1; Mon, 25 Jul 2022 19:13:04 -0400
X-MC-Unique: qSqZIlXWMRyXRcZgp68Sbg-1
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay10.hostedemail.com (Postfix) with ESMTP id C2E71C071E;
 Mon, 25 Jul 2022 23:13:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf17.hostedemail.com (Postfix) with ESMTPA id 697EA1E; 
 Mon, 25 Jul 2022 23:12:52 +0000 (UTC)
Message-ID: <c9340a12783beccac426d75f1df5b004c807ceb6.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: William Breathitt Gray <william.gray@linaro.org>
Date: Mon, 25 Jul 2022 16:12:51 -0700
In-Reply-To: <Yt6hMD+HIaERgrqg@fedora>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
 <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
 <YtnlAg6Qhf7fwXXW@MiWiFi-R3L-srv>
 <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
 <Yt6hMD+HIaERgrqg@fedora>
User-Agent: Evolution 3.44.1-0ubuntu1
MIME-Version: 1.0
X-Spam-Status: No, score=1.14
X-Stat-Signature: scxpfj6ognbxy16i47zhaoc7nn8mhr7p
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 697EA1E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18oibnQ1mEZciO6tvJNDDYSZCjv6uxPeLM=
X-HE-Tag: 1658790772-439912
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: linux-cachefs <linux-cachefs@redhat.com>,
 linux-doc <linux-doc@vger.kernel.org>, peterz <peterz@infradead.org>,
 bigeasy <bigeasy@linutronix.de>, ast <ast@kernel.org>, song <song@kernel.org>,
 sdf <sdf@google.com>, will <will@kernel.org>, daniel <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, "john.fastabend" <john.fastabend@gmail.com>,
 andrii <andrii@kernel.org>, mingo <mingo@redhat.com>, yhs <yhs@fb.com>,
 dyoung <dyoung@redhat.com>, vgoyal <vgoyal@redhat.com>,
 "boqun.feng" <boqun.feng@gmail.com>, kpsingh <kpsingh@kernel.org>,
 Slark Xiao <slark_xiao@163.com>, longman <longman@redhat.com>,
 tglx <tglx@linutronix.de>, haoluo <haoluo@google.com>,
 Baoquan He <bhe@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 kexec <kexec@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 jolsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 "martin.lau" <martin.lau@linux.dev>, kafai <kafai@fb.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2022-07-25 at 09:57 -0400, William Breathitt Gray wrote:
> On Mon, Jul 25, 2022 at 06:52:15AM -0700, Joe Perches wrote:
> > On Fri, 2022-07-22 at 07:45 +0800, Baoquan He wrote:
> > > The fix is done with below command:
> > > sed -i "s/the the /the /g" `git grep -l "the the " Documentation`
> > 
> > This command misses entries at EOL:
> > 
> > Documentation/trace/histogram.rst:  Here's an example where we use a compound key composed of the the
> > 
> > Perhaps a better conversion would be 's/\bthe the\b/the/g'
> 
> It would be good to check for instances that cross newlines as well;
> i.e. "the" at the end of a line followed by "the" at the start of the
> next line. However, this would require some thought to properly account
> for comment blocks ("*") and other similar prefixes that should be
> ignored.

checkpatch already attempts that duplicated word across a newline test.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

