Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FE54A846
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jun 2022 06:44:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-lPXFvks6PGSTTew1FCFGQg-1; Tue, 14 Jun 2022 00:44:45 -0400
X-MC-Unique: lPXFvks6PGSTTew1FCFGQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE7FC811E76;
	Tue, 14 Jun 2022 04:44:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BED54010E32;
	Tue, 14 Jun 2022 04:44:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA65C1947070;
	Tue, 14 Jun 2022 04:44:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5185A1947067 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 04:44:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F304400DF1D; Tue, 14 Jun 2022 04:44:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AD1740CFD0A
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 04:44:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 230FB811E75
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 04:44:41 +0000 (UTC)
Received: from out01.mta.xmission.com (out01.mta.xmission.com
 [166.70.13.231]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-7RkBO0HPMKCOwuUcDIJyqQ-1; Tue, 14 Jun 2022 00:44:38 -0400
X-MC-Unique: 7RkBO0HPMKCOwuUcDIJyqQ-1
Received: from in02.mta.xmission.com ([166.70.13.52]:60056)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1o0yPs-002t3o-D4; Mon, 13 Jun 2022 22:44:36 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:40374
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1o0yPr-008Y07-9H; Mon, 13 Jun 2022 22:44:36 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Frederick Lawler <fred@cloudflare.com>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
Date: Mon, 13 Jun 2022 23:44:28 -0500
In-Reply-To: <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com> (Frederick
 Lawler's message of "Mon, 13 Jun 2022 15:52:38 -0500")
Message-ID: <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1o0yPr-008Y07-9H; ; ;
 mid=<87y1xzyhub.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.174.4; ; ; frm=ebiederm@xmission.com;
 ; ; spf=softfail
X-XM-AID: U2FsdGVkX1+prA+7T4gv0KWu4+rCykKSU9Ye39R87hA=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
 T_TooManySym_01,T_TooManySym_02,XMSubLong,XM_SPF_SoftFail
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4955] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  2.5 XM_SPF_SoftFail SPF-SoftFail
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: ***;Frederick Lawler <fred@cloudflare.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 540 ms - load_scoreonly_sql: 0.07 (0.0%),
 signal_user_changed: 12 (2.2%), b_tie_ro: 10 (1.9%), parse: 1.30
 (0.2%), extract_message_metadata: 15 (2.8%), get_uri_detail_list: 2.4
 (0.5%), tests_pri_-1000: 23 (4.2%), tests_pri_-950: 1.22 (0.2%),
 tests_pri_-900: 1.01 (0.2%), tests_pri_-90: 123 (22.8%), check_bayes:
 121 (22.4%), b_tokenize: 12 (2.2%), b_tok_get_all: 10 (1.8%),
 b_comp_prob: 3.8 (0.7%), b_tok_touch_all: 92 (17.0%), b_finish: 0.89
 (0.2%), tests_pri_0: 337 (62.4%), check_dkim_signature: 0.53 (0.1%),
 check_dkim_adsp: 5 (0.9%), poll_dns_idle: 2.8 (0.5%), tests_pri_10:
 3.5 (0.6%), tests_pri_500: 19 (3.5%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v3] cred: Propagate
 security_prepare_creds() error code
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, amir73il@gmail.com,
 Paul Moore <paul@paul-moore.com>, linux-cifs@vger.kernel.org,
 selinux@vger.kernel.org, netdev@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, linux-doc@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-team@cloudflare.com, serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Frederick Lawler <fred@cloudflare.com> writes:

> Hi Eric,
>
> On 6/13/22 12:04 PM, Eric W. Biederman wrote:
>> Frederick Lawler <fred@cloudflare.com> writes:
>> 
>>> While experimenting with the security_prepare_creds() LSM hook, we
>>> noticed that our EPERM error code was not propagated up the callstack.
>>> Instead ENOMEM is always returned.  As a result, some tools may send a
>>> confusing error message to the user:
>>>
>>> $ unshare -rU
>>> unshare: unshare failed: Cannot allocate memory
>>>
>>> A user would think that the system didn't have enough memory, when
>>> instead the action was denied.
>>>
>>> This problem occurs because prepare_creds() and prepare_kernel_cred()
>>> return NULL when security_prepare_creds() returns an error code. Later,
>>> functions calling prepare_creds() and prepare_kernel_cred() return
>>> ENOMEM because they assume that a NULL meant there was no memory
>>> allocated.
>>>
>>> Fix this by propagating an error code from security_prepare_creds() up
>>> the callstack.
>> Why would it make sense for security_prepare_creds to return an error
>> code other than ENOMEM?
>>  > That seems a bit of a violation of what that function is supposed to do
>>
>
> The API allows LSM authors to decide what error code is returned from the
> cred_prepare hook. security_task_alloc() is a similar hook, and has its return
> code propagated.

It is not an api.  It is an implementation detail of the linux kernel.
It is a set of convenient functions that do a job.

The general rule is we don't support cases without an in-tree user.  I
don't see an in-tree user.

> I'm proposing we follow security_task_allocs() pattern, and add visibility for
> failure cases in prepare_creds().

I am asking why we would want to.  Especially as it is not an API, and I
don't see any good reason for anything but an -ENOMEM failure to be
supported.

Without an in-tree user that cares it is probably better to go the
opposite direction and remove the possibility of return anything but
memory allocation failure.  That will make it clearer to implementors
that a general error code is not supported and this is not a location
to implement policy, this is only a hook to allocate state for the LSM.

>> I have probably missed a very interesting discussion where that was
>> mentioned but I don't see link to the discussion or anything explaining
>> why we want to do that in this change.
>> 
>
> AFAIK, this is the start of the discussion.

You were on v3 and had an out of tree piece of code so I assumed someone
had at least thought about why you want to implement policy in a piece
of code whose only purpose is to allocate memory to store state.

Eric



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

