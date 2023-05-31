Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A07AB72450C
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Jun 2023 15:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686059967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ItG184jUnJMMXd9eDBsPVbj2TLsT6jBMs6eL0zzpxPE=;
	b=WABPA3mOkhcWyJX6rug4Bzs6XunzQpeS/3c6KZOJjQzOgHpNJx7S3SYAjc/SHWXkB0P0jJ
	t1dtG8ZipnNADlt8pv/c/nl+FBPscl3tjBac9QNysjUV6yb64EXlfCCVmRoWjuCoir7L7m
	Zf2FaslJvkr7zXmwfm0HZs1C/ehHYcU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-RIGTyMakOtOrtVbBMDPmQA-1; Tue, 06 Jun 2023 09:59:26 -0400
X-MC-Unique: RIGTyMakOtOrtVbBMDPmQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B674A3825BB0;
	Tue,  6 Jun 2023 13:59:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8A9C2166B25;
	Tue,  6 Jun 2023 13:59:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C6C41946A45;
	Tue,  6 Jun 2023 13:59:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B5EB19465B1 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 May 2023 19:31:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2829840C6CD0; Wed, 31 May 2023 19:31:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 207B040C6EC4
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 19:31:40 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04074185A78F
 for <linux-cachefs@redhat.com>; Wed, 31 May 2023 19:31:40 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-eVdcdd5PP0mfKVwrekswjQ-1; Wed, 31 May 2023 15:31:36 -0400
X-MC-Unique: eVdcdd5PP0mfKVwrekswjQ-1
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2566e60cc5aso3555058a91.3; 
 Wed, 31 May 2023 12:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685561495; x=1688153495;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkxhWE5ln5W4Ru3EpAV1+CbYcZ+ng9C+mZBukdpBf70=;
 b=DDZDwfYx2hFhmYBgjRT7WtRuEer5+EZmbN+CLvENOoYCqM90MVB1woVWqIDmqrhtcC
 DlGMzaA6uJlT3YJbjFfm3ZkJr/FYkjgfLgqEfDj5pLkPtnKDtY/4jvbnDgsWAafFBK4J
 rSxVmun6B/ywHiFqsEVFclVpfvRYjWdbCvA4N1SMTKy5533RR8m0EdKsy9h9iQxyZJTm
 S1GF9eqzbMr6Lab/kcJIhh4ua5TIHdW4CXTOVVITcrt7n5AHAn237KFujJWetuq2PPap
 /3nbOOuLYfmdrMWeByqPeU/q866fIQpq2nad/3+UqbWwaUq1BSQvoxjX5EUdxwGIjfIA
 sLGg==
X-Gm-Message-State: AC+VfDxdmozlJkNvcWEVOSJaeKc+n15RP+D4FopVN8204M7I2oFO2Eoa
 LFvj+a4oCwFd9PkzV9CDHDM=
X-Google-Smtp-Source: ACHHUZ6jVcItk0IyYkAw2stDb0JLeHq82CItdIVJ98e8SlK5bQfxCD/QIJhdJUNTzgVVF8W87q5ULg==
X-Received: by 2002:a17:90a:2808:b0:252:dd86:9c46 with SMTP id
 e8-20020a17090a280800b00252dd869c46mr6470479pjd.31.1685561494987; 
 Wed, 31 May 2023 12:31:34 -0700 (PDT)
Received: from [192.168.1.180] ([50.46.170.246])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a17090ace8800b0025686131b36sm1641165pju.11.2023.05.31.12.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 12:31:34 -0700 (PDT)
Message-ID: <97b35d43-337f-9cac-0a0b-86b216fce594@gmail.com>
Date: Wed, 31 May 2023 12:31:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
To: Christian Brauner <brauner@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
 <20230515-nutzen-umgekehrt-eee629a0101e@brauner>
 <75b4746d-d41e-7c9f-4bb0-42a46bda7f17@digikod.net>
 <20230530-mietfrei-zynisch-8b63a8566f66@brauner>
 <20230530142826.GA9376@lst.de>
 <301a58de-e03f-02fd-57c5-1267876eb2df@schaufler-ca.com>
 <20230530-tumult-adrenalin-8d48cb35d506@brauner>
From: Jay Freyensee <why2jjj.linux@gmail.com>
In-Reply-To: <20230530-tumult-adrenalin-8d48cb35d506@brauner>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 06 Jun 2023 13:59:23 +0000
Subject: Re: [Linux-cachefs] [PATCH -next 0/2] lsm: Change inode_setattr()
 to take struct
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
Cc: mortonm@chromium.org, rafael@kernel.org, roberto.sassu@huawei.com,
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-cifs@vger.kernel.org, paul@paul-moore.com, miklos@szeredi.hu,
 mpe@ellerman.id.au, jmorris@namei.org, code@tyhicks.com,
 linux-cachefs@redhat.com, linkinjeon@kernel.org, fred@cloudflare.com,
 serge@hallyn.com, nathanl@linux.ibm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, tom@talpey.com,
 wangweiyang2@huawei.com, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, eparis@parisplace.org,
 hirofumi@mail.parknet.co.jp, gnoack3000@gmail.com, linux-nfs@vger.kernel.org,
 john.johansen@canonical.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 mcgrof@kernel.org, chuck.lever@oracle.com,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

Ck9uIDUvMzAvMjMgOTowMSBBTSwgQ2hyaXN0aWFuIEJyYXVuZXIgd3JvdGU6Cj4gT24gVHVlLCBN
YXkgMzAsIDIwMjMgYXQgMDc6NTU6MTdBTSAtMDcwMCwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+
PiBPbiA1LzMwLzIwMjMgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+PiBPbiBU
dWUsIE1heSAzMCwgMjAyMyBhdCAwMzo1ODozNVBNICswMjAwLCBDaHJpc3RpYW4gQnJhdW5lciB3
cm90ZToKPj4+PiBUaGUgbWFpbiBjb25jZXJuIHdoaWNoIHdhcyBleHByZXNzZWQgb24gb3RoZXIg
cGF0Y2hzZXRzIGJlZm9yZSBpcyB0aGF0Cj4+Pj4gbW9kaWZ5aW5nIGlub2RlIG9wZXJhdGlvbnMg
dG8gdGFrZSBzdHJ1Y3QgcGF0aCBpcyBub3QgdGhlIHdheSB0byBnby4KPj4+PiBQYXNzaW5nIHN0
cnVjdCBwYXRoIGludG8gaW5kaXZpZHVhbCBmaWxlc3lzdGVtcyBpcyBhIGNsZWFyIGxheWVyaW5n
Cj4+Pj4gdmlvbGF0aW9uIGZvciBtb3N0IGlub2RlIG9wZXJhdGlvbnMsIHNvbWV0aW1lcyBkb3du
cmlnaHQgbm90IGZlYXNpYmxlLAo+Pj4+IGFuZCBpbiBnZW5lcmFsIGV4cG9zaW5nIHN0cnVjdCB2
ZnNtb3VudCB0byBmaWxlc3lzdGVtcyBpcyBhIGhhcmQgbm8uIEF0Cj4+Pj4gbGVhc3QgYXMgZmFy
IGFzIEknbSBjb25jZXJuZWQuCj4+PiBBZ3JlZWQuICBQYXNzaW5nIHN0cnVjdCBwYXRoIGludG8g
cmFuZG9tIHBsYWNlcyBpcyBub3QgaG93IHRoZSBWRlMgd29ya3MuCj4+Pgo+Pj4+IFNvIHRoZSBi
ZXN0IHdheSB0byBhY2hpZXZlIHRoZSBsYW5kbG9jayBnb2FsIG1pZ2h0IGJlIHRvIGFkZCBuZXcg
aG9va3MKPj4+IFdoYXQgaXMgInRoZSBsYW5kbG9jayBnb2FsIiwgYW5kIHdoeSBkb2VzIGl0IG1h
dHRlcj8KPj4+Cj4+Pj4gb3Igbm90LiBBbmQgd2Uga2VlcCBhZGRpbmcgbmV3IExTTXMgd2l0aG91
dCBkZXByZWNhdGluZyBvbGRlciBvbmVzIChBCj4+Pj4gcHJvYmxlbSB3ZSBhbHNvIGZhY2UgaW4g
dGhlIGZzIGxheWVyLikgYW5kIHRoZW4gdGhleSBzaXQgYXJvdW5kIGJ1dAo+Pj4+IHN0aWxsIG5l
ZWQgdG8gYmUgdGFrZW4gaW50byBhY2NvdW50IHdoZW4gZG9pbmcgY2hhbmdlcy4KPj4+IFllcywg
SSdtIHJlYWxseSB3b3JyaWVkIGFib3V0IHRoIGFtb3VudCBvZiBMU01zIHdlIGhhdmUsIGFuZCB0
aGUgd2VpcmQKPj4+IHRoaW5ncyB0aGV5IGRvLgo+PiBXaGljaCBMU00ocykgZG8geW91IHRoaW5r
IG91Z2h0IHRvIGJlIGRlcHJlY2F0ZWQ/IEkgb25seSBzZWUgb25lIHRoYXQgSQo+IEkgZG9uJ3Qg
aGF2ZSBhIGdvb2QgaW5zaWdodCBpbnRvIHdoYXQgTFNNcyBhcmUgYWN0aXZlbHkgdXNlZCBvciBh
cmUKPiBlZmZlY3RpdmVseSB1bnVzZWQgYnV0IEkgd291bGQgYmUgY3VyaW91cyB0byBoZWFyIHdo
YXQgTFNNcyBhcmUKPiBjb25zaWRlcmVkIGFjdGl2ZWx5IHVzZWQvbWFpbnRhaW5lZCBmcm9tIHRo
ZSBMU00gbWFpbnRhaW5lcidzCj4gcGVyc3BlY3RpdmUuCgpJdCdzIHBhcnQgb2YgbXkgam9iIHRv
IGxvb2sgYXQgZnVuY3Rpb25hbGl0eSBlbmFibGVkIGJ5IExTTXMgYW5kIGhvdyAKdGhleSBjYW4g
YmUgYXBwbGllZCB0byBwcm9kdWN0IHNlY3VyaXR5IGZlYXR1cmVzIGFuZCBwcm9kdWN0cyBhdCB0
aGUgCmRpc3RybyBsZXZlbC4KCkZpcnN0IG9mIGFsbCB0aGUgZmxleGliaWxpdHkgb2Ygc3RhY2tp
bmcgTFNNJ3MgaGFzIGdyZWF0bHkgaGVscGVkIGVuYWJsZSAKbmV3IGFuZCBtb3JlIGZlYXR1cmVz
IHRvIGJlIHJ1biBhdCB0aGUgc2FtZSB0aW1lIG9uIGEgTGludXggcGxhdGZvcm0uCgpTbyB0aGVy
ZSBhcmUgZmVhdHVyZSBidXp6IHdvcmRzIG91dCB0aGVyZSwgdGhlIG1haW4gb25lcyBJJ20gZmFt
aWxpYXIgCndpdGgswqAgbGlrZSBwcm9jZXNzIGNvbnRyb2wsIGFudGktdGFtcGVyaW5nL3NlbGYt
cHJvdGVjdCwgcXVhcmFudGluZSwgCnByb2Nlc3MgaW5qZWN0aW9uLsKgIFRoZSBMU00ncyBJJ3Zl
IHRyaWVkIHRvIGZvbGxvdyB3L3Jlc3BlY3QgdG8gdGhlc2UgCmZlYXR1cmVzIGhhdmUgaW5jbHVk
ZWQgU0VMaW51eCwgQXBwQXJtb3IsIHlhbWEsIGJwZi9rcnNpLCBsYW5kbG9jaywgYW5kIApzYWZl
c2V0aWQuCgpVc3VhbGx5IGZvciBwcm9jZXNzIGNvbnRyb2wgcHBsIGFyZSBtb3N0IGludGVyZXN0
ZWQgaW4ga2lsbGluZyBhIHByb2Nlc3MgCnF1aWNrbHkgaWYgaXRzIGRldGVjdGVkIGEgdGhyZWF0
LsKgIEluIHRoYXQgZW5kIGJwZi9rcnNpIExTTSBpcyBhIAp3b25kZXJmdWwgTFNNIGZvciB0aGlz
IGFuZCBwdXRzIExpbnV4IG9uIHBhciB3aXRoIFdpbmRvd3MgYW5kIG1hY09TIHdpdGggCnRoaXMg
ZmVhdHVyZSAodGhvdWdoIHRoZSBhY3R1YWwga2lsbCBvcGVyYXRpb24gc2VlbXMgc2xvd2VyKS4K
CmFudGktdGFtcGVyaW5nL3NlbGYtcHJvdGVjdCBpcyBhIG1lY2hhbmlzbSB0byBwcmV2ZW50IHNh
eSwgYW4gYW50aS12aXJ1cyAKcHJvZ3JhbSBmcm9tIGdldHRpbmcga2lsbGVkIGJ5IGEgdGhyZWF0
IHByb2Nlc3MgZXZlbiBpZiB0aGF0IHByb2Nlc3MgaGFzIApyb290LsKgIEkgYmVsaWV2ZSB0aGlz
IGNvdWxkIGJlIGRvbmUgdmlhIFNFTGludXgsIEFwcGFybW9yLCBtYXliZSBicGYsIAphbmQgbWF5
YmUgbGFuZGxvY2suwqAgSW4gY29tcGFyaXNvbiwgbWFjT1MgZG9lcyBoYXZlIHRoaXMgZnVuY3Rp
b25hbGl0eSAKdmlhIGl0cyBFbmRwb2ludCBTZWN1cml0eSBzdWJzeXN0ZW0uCgpwcm9jZXNzIGlu
amVjdGlvbiB3b3VsZCBiZSBhIHdheSB0byBtb25pdG9yIGEgcHJvY2VzcyB3aGljaCwgeWFtYSB3
b3VsZCAKaGF2ZSB0byBiZSB0dXJuZWQgb2ZmIHdoaWNoIHRoZW4gYSBjdXN0b21lciB3b3VsZCBo
YXZlIHRvIG1ha2UgYSBjYWxsIGlmIAp0aGV5IHdhbnQgdGhlIHByb3RlY3Rpb24gb2YgeWFtYSdz
IGRpc2FibGVtZW50IG9mIHRyYWNpbmcgb3ZlciB3aGF0ZXZlciAKcHJvY2VzcyBpbmplY3Rpb24g
ZmVhdHVyZSB0aGUgc2VjdXJpdHkgY29tcGFueSBtYXkgYmUgb2ZmZXJpbmcuCgpRdWFyYW50aW5l
IGlzIGEgd2F5IHRvIHNhbmRib3ggYSBwcm9jZXNzIHRoYXQgaGFzIG5vdCBiZWVuIGRldGVybWlu
ZWQgdG8gCmJlIGEgdGhyZWF0IG9yIG5vdCAodW5rbm93bikgYW5kIGNhbiBiZSBzdG9yZWQgImZv
ciBsYXRlciAobGF0ZXIgCnRlcm1pbmF0aW9uIG9yIHNhdmUta2VlcGluZyBmb3Igc3R1ZHkiLsKg
IFRoYXQgd291bGQgYmUgYSBuZWF0IGZ1dHVyZSAKTFNNLCBvbmUgSSB0aG91Z2h0IGNvdWxkIGJl
IHRhY2tlZCBvbnRvIGxhbmRsb2NrIChidXQgZnJvbSB3aGF0IEkgCnVuZGVyc3RhbmQgd291bGQg
cmVxdWlyZSB0aGUgdXNlIG9mIGNncm91cHMpLgoKQW5kIHNwZWFraW5nIG9mIGZ1dHVyZSBMU01z
LCBJIHJlYWQgb25lIHByb3Bvc2FsIEkgc2F3IHRoYXQgSSB0aG91Z2h0IAp3YXMgYSBnb29kIGlk
ZWEgY2FsbGVkIHRoZSBOQVggZHJpdmVyIHRoYXQgd2FzIHNvbWV0aGluZyBsaWtlIHRoZSB0aGUg
CnlhbWEgZHJpdmVyLCBvbmx5IGl0cyBzb2xlIHB1cnBvc2Ugd2FzIHRvIHNodXQgb2ZmIHRoZSBh
bm9ueW1vdXMgCmV4ZWN1dGFibGUgcGFnZXMgZm9yIGZpbGVsZXNzIG1hbHdhcmUgcHJvdGVjdGlv
bi4gQnV0IGl0IGRpZG4ndCBsb29rIApsaWtlIGl0IGdvdCBhbnl3aGVyZS4KClNvbWUgaW50ZXJl
c3RpbmcgdXNhZ2VzL2JlbGllZnMgb2YgTFNNJ3MgSSd2ZSBzZWVuOgoKKlVzaW5nIFNFTGludXgg
b3ZlciBBcHBBcm1vciB3aWxsIGhlbHAgYSBzZWN1cml0eSBzb2x1dGlvbiBjb21wYW55IHdpbiBh
IApnb3Z0IGNvbnRyYWN0IGR1ZSB0byB0aGUgTlNBIHJlbGF0aW9uc2hpcCB3aXRoIFNFTGludXgu
CgoqVGhlIGJlbGllZiBsb2NrZG93biB3aWxsIHNodXQgb2ZmIG9yIGNhdXNlIGlzc3VlcyB3aXRo
IGVicGYsIHRodXMgaXRzIApub3QgYWN0aXZhdGVkIGFuZCB1c2VkIG11Y2guCgoqUkhFTCA4Ljcg
aGF2aW5nIHlhbWEgZHJpdmVyIHNldCB0byAwIHVwb24gaW5zdGFsbCwgd2hpY2ggSSB0aG91Z2h0
IHRoZSAKa2VybmVsIEtjb25maWcgZGVmYXVsdCB3YXMgMT8gU28gaXQgbWFrZXMgbWUgd29uZGVy
IHdoYXQgb3RoZXIgZGlzdHJvIAppbnN0YWxscyBzZXQgeWFtYSB0byAwIGJ5IGRlZmF1bHQ/IE1h
eWJlIHlhbWEgY2F1c2VzIGFuIGlzc3VlIHdpdGggM3JkIApwYXJ0eSBTVyBpZiBpdHMgZW5hYmxl
ZCB0byAxLT4zLgoKCklmIHlvdSB3YW50IHRvIGxvb2sgYXQgYSBzZWN1cml0eSBwcm9kdWN0IG1h
a2luZyB1c2Ugb2YgTFNNJ3MsIGNoZWNrIG91dCAKS3ViZUFybW9yLgoKSG9wZSB0aGlzIGhlbHBz
Li4uc29tZW9uZSA6LSkKCgoKCi0tCkxpbnV4LWNhY2hlZnMgbWFpbGluZyBsaXN0CkxpbnV4LWNh
Y2hlZnNAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWNhY2hlZnMK

