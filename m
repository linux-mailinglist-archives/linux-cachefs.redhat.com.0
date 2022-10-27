Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A36CF61045F
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 23:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666906097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yjYI+X/UEzhrzqb+aFrbQQ++IN3n+/BuKxxy5w3wGQ4=;
	b=QlP4zVw60G8z5dx60xeZYTWC1z5nOPvQAufTbqet5zzv7wPMcHmcSDzl/9zXiOZ3qA9tgZ
	0ei3E9EAg+9LY+CY/MJ0kqDN74KD2pC6eH5YmjH+bOFgjTMIZw6A91UfjFzal9plgy7VzO
	ybgloCLsvg9fh81F5Vdaesy5+W6irKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-8ZS5tvKEMYu_yyHZ8gY-Bg-1; Thu, 27 Oct 2022 17:28:16 -0400
X-MC-Unique: 8ZS5tvKEMYu_yyHZ8gY-Bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B798811E67;
	Thu, 27 Oct 2022 21:28:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 099B64014CE8;
	Thu, 27 Oct 2022 21:28:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A0FC19466DF;
	Thu, 27 Oct 2022 21:28:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A8C61946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 19:16:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C93A540C206B; Thu, 27 Oct 2022 19:16:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1CEA40C2065
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 19:16:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3110811E84
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 19:16:10 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-RHPSj_p1Mmqckmc2WPqQ5g-1; Thu, 27 Oct 2022 15:16:06 -0400
X-MC-Unique: RHPSj_p1Mmqckmc2WPqQ5g-1
Received: by mail-il1-f171.google.com with SMTP id 7so1647316ilg.11;
 Thu, 27 Oct 2022 12:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=puH3WQXM1tpFBJQ6m4h8TSh1q45MWnD3/cfqkRxA6Ms=;
 b=m0rn/nleBuETf+QGGeje3Y8I3lYUHyAYpGqH03yzqSytbWUg5un7ZPcvVgoP0MaRXP
 gpYRfzGdWTKf+RWoG+ypyU3KbL+UoXgNxMG7uHhj7DrTwYrSbBBvn3dHmshkwZDQvdW2
 wy19VLs/oZn/zI1DCwK4lfRgNfCEz8dvz7kitj9VO8lqfIj4V8egZo9ecCO93xMWEYq0
 hVwhQmLS/BtP9+m+560fE+TmbxE/EuzBaFL9kLxHvkOM4DGjkRgz6cfKt81WQXZuwBGS
 GIWPJvpng8DfL+kqiLrID/Mg3l7LUs0uaGZtc1eZ5zcUX74V+DlyuIgyYIyJE0c1btYy
 4Iog==
X-Gm-Message-State: ACrzQf3hdzJjhb0bvvV7imVhVbBdAPI18/2jeruczh3MwOYOTKGOkY4W
 lkKRibnLGodszLG+rHzu6vpEJNzNTw==
X-Google-Smtp-Source: AMsMyM6V9MRlBqEVAwKOwN+1vWoFZigoYRHEkhAtsaf/E+m4OmsJr/1TbCxQz5b04McfMBefhI7AOw==
X-Received: by 2002:a05:6e02:1561:b0:300:3d37:6296 with SMTP id
 k1-20020a056e02156100b003003d376296mr9566542ilu.233.1666898164756; 
 Thu, 27 Oct 2022 12:16:04 -0700 (PDT)
Received: from [192.168.75.138] (50-36-85-28.alma.mi.frontiernet.net.
 [50.36.85.28]) by smtp.gmail.com with ESMTPSA id
 p13-20020a92da4d000000b002eb5eb4f8f9sm816570ilq.77.2022.10.27.12.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 12:16:04 -0700 (PDT)
Message-ID: <870684b35a45b94c426554a62b63f80f421dbb08.camel@kernel.org>
From: Trond Myklebust <trondmy@kernel.org>
To: Dave Wysochanski <dwysocha@redhat.com>, Anna Schumaker
 <anna.schumaker@netapp.com>, Trond Myklebust
 <trond.myklebust@hammerspace.com>,  David Howells <dhowells@redhat.com>
Date: Thu, 27 Oct 2022 15:16:03 -0400
In-Reply-To: <20221017105212.77588-4-dwysocha@redhat.com>
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-4-dwysocha@redhat.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 27 Oct 2022 21:28:10 +0000
Subject: Re: [Linux-cachefs] [PATCH v9 3/5] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIyLTEwLTE3IGF0IDA2OjUyIC0wNDAwLCBEYXZlIFd5c29jaGFuc2tpIHdyb3Rl
Ogo+IENvbnZlcnQgdGhlIE5GUyBidWZmZXJlZCByZWFkIGNvZGUgcGF0aHMgdG8gY29ycmVzcG9u
ZGluZyBuZXRmcyBBUElzLAo+IGJ1dCBvbmx5IHdoZW4gZnNjYWNoZSBpcyBjb25maWd1cmVkIGFu
ZCBlbmFibGVkLgo+IAo+IFRoZSBuZXRmcyBBUEkgZGVmaW5lcyBzdHJ1Y3QgbmV0ZnNfcmVxdWVz
dF9vcHMgd2hpY2ggbXVzdCBiZSBmaWxsZWQKPiBpbiBieSB0aGUgbmV0d29yayBmaWxlc3lzdGVt
LsKgIEZvciBORlMsIHdlIG9ubHkgbmVlZCB0byBkZWZpbmUgNSBvZgo+IHRoZSBmdW5jdGlvbnMs
IHRoZSBtYWluIG9uZSBiZWluZyB0aGUgaXNzdWVfcmVhZCgpIGZ1bmN0aW9uLgo+IFRoZSBpc3N1
ZV9yZWFkKCkgZnVuY3Rpb24gaXMgY2FsbGVkIGJ5IHRoZSBuZXRmcyBsYXllciB3aGVuIGEgcmVh
ZAo+IGNhbm5vdCBiZSBmdWxmaWxsZWQgbG9jYWxseSwgYW5kIG11c3QgYmUgc2VudCB0byB0aGUg
c2VydmVyIChlaXRoZXIKPiB0aGUgY2FjaGUgaXMgbm90IGFjdGl2ZSwgb3IgaXQgaXMgYWN0aXZl
IGJ1dCB0aGUgZGF0YSBpcyBub3QKPiBhdmFpbGFibGUpLgo+IE9uY2UgdGhlIHJlYWQgZnJvbSB0
aGUgc2VydmVyIGlzIGNvbXBsZXRlLCBuZXRmcyByZXF1aXJlcyBhIGNhbGwgdG8KPiBuZXRmc19z
dWJyZXFfdGVybWluYXRlZCgpIHdoaWNoIGNvbnZleXMgZWl0aGVyIGhvdyBtYW55IGJ5dGVzIHdl
cmUKPiByZWFkCj4gc3VjY2Vzc2Z1bGx5LCBvciBhbiBlcnJvci7CoCBOb3RlIHRoYXQgaXNzdWVf
cmVhZCgpIGlzIGNhbGxlZCB3aXRoIGEKPiBzdHJ1Y3R1cmUsIG5ldGZzX2lvX3N1YnJlcXVlc3Qs
IHdoaWNoIGRlZmluZXMgdGhlIElPIHJlcXVlc3RlZCwgYW5kCj4gY29udGFpbnMgYSBzdGFydCBh
bmQgYSBsZW5ndGggKGJvdGggaW4gYnl0ZXMpLCBhbmQgYXNzdW1lcyB0aGUKPiB1bmRlcmx5aW5n
Cj4gbmV0ZnMgd2lsbCByZXR1cm4gYSBlaXRoZXIgYW4gZXJyb3Igb24gdGhlIHdob2xlIHJlZ2lv
biwgb3IgdGhlCj4gbnVtYmVyCj4gb2YgYnl0ZXMgc3VjY2Vzc2Z1bGx5IHJlYWQuCj4gCj4gVGhl
IE5GUyBJTyBwYXRoIGlzIHBhZ2UgYmFzZWQgYW5kIHRoZSBtYWluIEFQSXMgYXJlIHRoZSBwZ2lv
IEFQSXMKPiBkZWZpbmVkCj4gaW4gcGFnZWxpc3QuYy7CoCBGb3IgdGhlIHBnaW8gQVBJcywgdGhl
cmUgaXMgbm8gd2F5IGZvciB0aGUgY2FsbGVyIHRvCj4ga25vdyBob3cgbWFueSBSUENzIHdpbGwg
YmUgc2VudCBhbmQgaG93IHRoZSBwYWdlcyB3aWxsIGJlIGJyb2tlbiB1cAo+IGludG8gdW5kZXJs
eWluZyBSUENzLCBlYWNoIG9mIHdoaWNoIHdpbGwgaGF2ZSB0aGVpciBvd24gY29tcGxldGlvbgo+
IGFuZAo+IHJldHVybiBjb2RlLsKgIEluIGNvbnRyYXN0LCBuZXRmcyBpcyBzdWJyZXF1ZXN0IGJh
c2VkLCBhIHNpbmdsZQo+IHN1YnJlcXVlc3QgbWF5IGNvbnRhaW4gbXVsdGlwbGUgcGFnZXMsIGFu
ZCBhIHNpbmdsZSBzdWJyZXF1ZXN0IGlzCj4gaW5pdGlhdGVkIHdpdGggaXNzdWVfcmVhZCgpIGFu
ZCB0ZXJtaW5hdGVkIHdpdGgKPiBuZXRmc19zdWJyZXFfdGVybWluYXRlZCgpLgo+IFRodXMsIHRv
IHV0aWx6ZSB0aGUgbmV0ZnMgQVBJcywgTkZTIG5lZWRzIHNvbWUgd2F5IHRvIGFjY29tbW9kYXRl
Cj4gdGhlIG5ldGZzIEFQSSByZXF1aXJlbWVudCBvbiB0aGUgc2luZ2xlIHJlc3BvbnNlIHRvIHRo
ZSB3aG9sZQo+IHN1YnJlcXVlc3QsIHdoaWxlIGFsc28gbWluaW1pemluZyBkaXNydXB0aXZlIGNo
YW5nZXMgdG8gdGhlIE5GUwo+IHBnaW8gbGF5ZXIuCj4gCj4gVGhlIGFwcHJvYWNoIHRha2VuIHdp
dGggdGhpcyBwYXRjaCBpcyB0byBhbGxvY2F0ZSBhIHNtYWxsIHN0cnVjdHVyZQo+IGZvciBlYWNo
IG5mc19uZXRmc19pc3N1ZV9yZWFkKCkgY2FsbCwgc3RvcmUgdGhlIGZpbmFsIGVycm9yIGFuZAo+
IG51bWJlcgo+IG9mIGJ5dGVzIHN1Y2Nlc3NmdWxseSB0cmFuc2ZlcnJlZCBpbiB0aGUgc3RydWN0
dXJlLCBhbmQgdXBkYXRlIHRoZXNlCj4gdmFsdWVzCj4gYXMgZWFjaCBSUEMgY29tcGxldGVzLsKg
IFRoZSByZWZjb3VudCBvbiB0aGUgc3RydWN0dXJlIGlzIHVzZWQgYXMgYQo+IG1hcmtlcgo+IGZv
ciB0aGUgbGFzdCBSUEMgY29tcGxldGlvbiwgaXMgaW5jcmVtZW50ZWQgaW4KPiBuZnNfbmV0ZnNf
cmVhZF9pbml0aWF0ZSgpLAo+IGFuZCBkZWNyZW1lbnRlZCBpbnNpZGUgbmZzX25ldGZzX3JlYWRf
Y29tcGxldGlvbigpLCB3aGVuIGEKPiBuZnNfcGdpb19oZWFkZXIKPiBjb250YWlucyBhIHZhbGlk
IHBvaW50ZXIgdG8gdGhlIGRhdGEuwqAgT24gdGhlIGZpbmFsIHB1dCAod2hpY2gKPiBzaWduYWxz
Cj4gdGhlIGZpbmFsIG91dHN0YW5kaW5nIFJQQyBpcyBjb21wbGV0ZSkgaW4KPiBuZnNfbmV0ZnNf
cmVhZF9jb21wbGV0aW9uKCksCj4gY2FsbCBuZXRmc19zdWJyZXFfdGVybWluYXRlZCgpIHdpdGgg
ZWl0aGVyIHRoZSBmaW5hbCBlcnJvciB2YWx1ZSAoaWYKPiBvbmUgb3IgbW9yZSBSRUFEcyBjb21w
bGV0ZSB3aXRoIGFuIGVycm9yKSBvciB0aGUgbnVtYmVyIG9mIGJ5dGVzCj4gc3VjY2Vzc2Z1bGx5
IHRyYW5zZmVycmVkIChpZiBhbGwgUlBDcyBjb21wbGV0ZSBzdWNjZXNzZnVsbHkpLsKgIE5vdGUK
PiB0aGF0IHdoZW4gYWxsIFJQQ3MgY29tcGxldGUgc3VjY2Vzc2Z1bGx5LCB0aGUgbnVtYmVyIG9m
IGJ5dGVzCj4gdHJhbnNmZXJyZWQKPiBpcyBjYXBwZWQgdG8gdGhlIGxlbmd0aCBvZiB0aGUgc3Vi
cmVxdWVzdC7CoCBDYXBwaW5nIHRoZSB0cmFuc2ZlcnJlZAo+IGxlbmd0aAo+IHRvIHRoZSBzdWJy
ZXF1ZXN0IGxlbmd0aCBwcmV2ZW50cyAiU3VicmVxIG92ZXJyZWFkIiB3YXJuaW5ncyBmcm9tCj4g
bmV0ZnMuCj4gVGhpcyBpcyBkdWUgdG8gdGhlICJhbGlnbmVkX2xlbiIgaW4gbmZzX3BhZ2Vpb19h
ZGRfcGFnZSgpLCBhbmQgdGhlCj4gY29ybmVyIGNhc2Ugd2hlcmUgTkZTIHJlcXVlc3RzIGEgZnVs
bCBwYWdlIGF0IHRoZSBlbmQgb2YgdGhlIGZpbGUsCj4gZXZlbiB3aGVuIGlfc2l6ZSByZWZsZWN0
cyBvbmx5IGEgcGFydGlhbCBwYWdlIChORlMgb3ZlcnJlYWQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IERhdmUgV3lzb2NoYW5za2kgPGR3eXNvY2hhQHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEpl
ZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+CgoKVGhpcyBpcyBub3QgZG9pbmcgd2hhdCBJ
IGFza2VkIGZvciwgd2hpY2ggd2FzIHRvIHNlcGFyYXRlIG91dCB0aGUKZnNjYWNoZSBmdW5jdGlv
bmFsaXR5LCBzbyB0aGF0IHdlIGNhbiBjYWxsIHRoYXQgaWYgYW5kIHdoZW4gaXQgaXMKYXZhaWxh
YmxlLgoKSW5zdGVhZCwgaXQgaXMganVzdCB3cmFwcGluZyB0aGUgTkZTIHJlcXVlc3RzIGluc2lk
ZSBuZXRmcyByZXF1ZXN0cy4gQXMKaXQgc3RhbmRzLCB0aGF0IG1lYW5zIGl0IGlzIGp1c3QgZHVw
bGljYXRpbmcgaW5mb3JtYXRpb24sIGFuZCBhZGRpbmcKdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgdG8g
dGhlIHN0YW5kYXJkIEkvTyBwYXRoIChleHRyYSBhbGxvY2F0aW9ucywgZXh0cmEKaW5kaXJlY3Qg
Y2FsbHMsIGFuZCBleHRyYSBibG9hdCB0byB0aGUgaW5vZGUpLgoKTXkgZXhwZWN0YXRpb24gaXMg
dGhhdCB0aGUgc3RhbmRhcmQgSS9PIHBhdGggc2hvdWxkIGhhdmUgbWluaW1hbApvdmVyaGVhZCwg
YW5kIHNob3VsZCBjZXJ0YWlubHkgbm90IGluY3JlYXNlIHRoZSBvdmVyaGVhZCB0aGF0IHdlCmFs
cmVhZHkgaGF2ZS4gV2lsbCB0aGlzIGJlIGFkZHJlc3NlZCBpbiBmdXR1cmUgaXRlcmF0aW9ucyBv
ZiB0aGVzZQpwYXRjaGVzPwoKLS0gClRyb25kIE15a2xlYnVzdApMaW51eCBORlMgY2xpZW50IG1h
aW50YWluZXIsIEhhbW1lcnNwYWNlCnRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20KCgot
LQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1jYWNoZWZzCg==

