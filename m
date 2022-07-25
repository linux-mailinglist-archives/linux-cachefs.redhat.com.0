Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E6580051
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 16:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658757758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jrgPINgXdXYhVHqRut7uctr20MzPbXuL9rb9SjTr2sQ=;
	b=gnrvtX4cvy/LX/3qW7YX8Xh38pEG1C3Nn6HsWwENqZUPA8TPigWy/4Q0eXnSg8091YARb7
	9YLktakGVDMQcnOk+daLMkIBeqm278PAGgD0l7dCW2VkbTd8Wj16Q1Q9jplK0rs73/lIbV
	atGublBIiUMyTtefmm12/ZZ2SbRiNBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-Lrk7ElKgP16zk9HWaeY9tw-1; Mon, 25 Jul 2022 10:02:37 -0400
X-MC-Unique: Lrk7ElKgP16zk9HWaeY9tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7C69811E75;
	Mon, 25 Jul 2022 14:02:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8771840C1288;
	Mon, 25 Jul 2022 14:02:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 47BBB1945D87;
	Mon, 25 Jul 2022 14:02:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67BF41945D81 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 14:02:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54CA81121319; Mon, 25 Jul 2022 14:02:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 513AE1121314
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 14:02:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 342453C10684
 for <linux-cachefs@redhat.com>; Mon, 25 Jul 2022 14:02:34 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-p8-LvOTBMZ2Uo-IXn2Ld6A-1; Mon, 25 Jul 2022 10:02:29 -0400
X-MC-Unique: p8-LvOTBMZ2Uo-IXn2Ld6A-1
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay05.hostedemail.com (Postfix) with ESMTP id 9BD664105A;
 Mon, 25 Jul 2022 13:52:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf13.hostedemail.com (Postfix) with ESMTPA id 2CBFA2000E; 
 Mon, 25 Jul 2022 13:52:16 +0000 (UTC)
Message-ID: <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Jonathan Corbet <corbet@lwn.net>, Slark Xiao <slark_xiao@163.com>
Date: Mon, 25 Jul 2022 06:52:15 -0700
In-Reply-To: <YtnlAg6Qhf7fwXXW@MiWiFi-R3L-srv>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
 <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
 <YtnlAg6Qhf7fwXXW@MiWiFi-R3L-srv>
User-Agent: Evolution 3.44.1-0ubuntu1
MIME-Version: 1.0
X-Stat-Signature: 7gktrdtqywj6jsoc4553wwy1ksexyrp9
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 2CBFA2000E
X-Spam-Status: No, score=1.40
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+L2rRg9wujM2WCCGt5WkY3LxQACR7fn/A=
X-HE-Tag: 1658757136-644642
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 "william.gray" <william.gray@linaro.org>,
 "john.fastabend" <john.fastabend@gmail.com>, andrii <andrii@kernel.org>,
 mingo <mingo@redhat.com>, longman <longman@redhat.com>,
 dyoung <dyoung@redhat.com>, vgoyal <vgoyal@redhat.com>,
 "boqun.feng" <boqun.feng@gmail.com>, kpsingh <kpsingh@kernel.org>,
 yhs <yhs@fb.com>, tglx <tglx@linutronix.de>, haoluo <haoluo@google.com>,
 kexec <kexec@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 jolsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 "martin.lau" <martin.lau@linux.dev>, kafai <kafai@fb.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-07-22 at 07:45 +0800, Baoquan He wrote:
> On 07/21/22 at 11:40am, Randy Dunlap wrote:
> > On 7/21/22 11:36, Jonathan Corbet wrote:
> > > "Slark Xiao" <slark_xiao@163.com> writes:
> > > > May I know the maintainer of one subsystem could merge the changes
> > > > contains lots of subsystem?  I also know this could be filtered by
> > > > grep and sed command, but that patch would have dozens of maintainers
> > > > and reviewers.
> > > 
> > > Certainly I don't think I can merge a patch touching 166 files across
> > > the tree.  This will need to be broken down by subsystem, and you may
> > > well find that there are some maintainers who don't want to deal with
> > > this type of minor fix.
> > 
> > We have also seen cases where "the the" should be replaced by "then the"
> > or some other pair of words, so some of these changes could fall into
> > that category.
> 
> It's possible. I searched in Documentation and went through each place,
> seems no typo of "then the". Below patch should clean up all the 'the the'
> typo under Documentation.
[]
> The fix is done with below command:
> sed -i "s/the the /the /g" `git grep -l "the the " Documentation`

This command misses entries at EOL:

Documentation/trace/histogram.rst:  Here's an example where we use a compound key composed of the the

Perhaps a better conversion would be 's/\bthe the\b/the/g'

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

